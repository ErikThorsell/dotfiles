-- :GerritComments <n> -- read every inline review comment on a Gerrit change.
--
-- gerrit.nvim only renders comments attached to the *current* patch set, so on
-- an iterated change most of the discussion (which lives on older patch sets)
-- is invisible. This pulls the comments from every patch set via a single
-- `gerrit query` over ssh and lists them, grouped by file, in a scratch buffer
-- you keep open next to the diff. Paired with the `git grc` alias.

local M = {}

-- Work out the ssh destination from the repo's `origin` remote, so this follows
-- whatever Gerrit the current repository points at rather than being hardwired.
local function origin_target()
	local url = vim.trim(vim.fn.system({ "git", "remote", "get-url", "origin" }))
	if vim.v.shell_error ~= 0 or url == "" then
		return nil, "no origin remote in this repository"
	end

	local user, host, port = url:match("^ssh://([^@]+)@([^:/]+):(%d+)")
	if not host then
		user, host = url:match("^ssh://([^@]+)@([^:/]+)")
	end
	if not host then
		user, host = url:match("^([^@]+)@([^:]+):") -- scp-style user@host:project
	end
	if not host then
		return nil, "origin is not an ssh Gerrit remote: " .. url
	end
	return { user = user, host = host, port = port }
end

-- /COMMIT_MSG and /PATCHSET_LEVEL are Gerrit's synthetic files; sort them after
-- the real ones and give them a friendlier heading.
local function file_rank(f)
	if f == "/PATCHSET_LEVEL" then
		return 3
	elseif f == "/COMMIT_MSG" then
		return 2
	end
	return 1
end

local function file_label(f)
	if f == "/COMMIT_MSG" then
		return "/COMMIT_MSG (commit message)"
	elseif f == "/PATCHSET_LEVEL" then
		return "/PATCHSET_LEVEL (change-level)"
	end
	return f
end

local function render(change, n)
	local by_file = {}
	for _, ps in ipairs(change.patchSets or {}) do
		for _, c in ipairs(ps.comments or {}) do
			local f = c.file or "?"
			by_file[f] = by_file[f] or {}
			table.insert(by_file[f], {
				ps = ps.number,
				line = c.line or 0,
				who = (c.reviewer and c.reviewer.name) or "someone",
				message = c.message or "",
			})
		end
	end

	local files = vim.tbl_keys(by_file)
	table.sort(files, function(a, b)
		local ra, rb = file_rank(a), file_rank(b)
		if ra ~= rb then
			return ra < rb
		end
		return a < b
	end)

	local cur = change.currentPatchSet and change.currentPatchSet.number or "?"
	local lines = {
		"# Gerrit comments -- change " .. n,
		change.subject or "",
		("%s   status: %s   current PS: %s"):format(change.url or "", change.status or "?", tostring(cur)),
		"",
	}

	local total = 0
	for _, f in ipairs(files) do
		local cs = by_file[f]
		table.sort(cs, function(a, b)
			if a.line ~= b.line then
				return a.line < b.line
			end
			return (tonumber(a.ps) or 0) < (tonumber(b.ps) or 0)
		end)
		table.insert(lines, "## " .. file_label(f))
		for _, c in ipairs(cs) do
			total = total + 1
			local loc = (c.line and c.line > 0) and ("L" .. c.line) or "(file)"
			table.insert(lines, ("- PS%s %s  %s"):format(tostring(c.ps), loc, c.who))
			for _, ml in ipairs(vim.split(c.message, "\n", { plain = true })) do
				table.insert(lines, "    " .. ml)
			end
		end
		table.insert(lines, "")
	end

	if total == 0 then
		table.insert(lines, "_No inline comments on any patch set._")
	else
		lines[1] = lines[1] .. ("  (%d comments)"):format(total)
	end
	return lines
end

local function open_scratch(lines, n)
	vim.cmd("tabnew")
	local buf = vim.api.nvim_get_current_buf()
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
	vim.bo[buf].buftype = "nofile"
	vim.bo[buf].bufhidden = "wipe"
	vim.bo[buf].swapfile = false
	vim.bo[buf].filetype = "markdown"
	vim.bo[buf].modifiable = false
	pcall(vim.api.nvim_buf_set_name, buf, "gerrit-comments-" .. n)
	vim.keymap.set("n", "q", "<cmd>tabclose<CR>", { buffer = buf, nowait = true, silent = true })
end

function M.show(n)
	n = vim.trim(tostring(n or ""))
	if not n:match("^%d+$") then
		vim.notify("GerritComments: expected a change number", vim.log.levels.ERROR)
		return
	end

	local target, err = origin_target()
	if not target then
		vim.notify("GerritComments: " .. err, vim.log.levels.ERROR)
		return
	end

	local argv = { "ssh", "-o", "BatchMode=yes" }
	if target.port then
		vim.list_extend(argv, { "-p", target.port })
	end
	table.insert(argv, (target.user and target.user .. "@" or "") .. target.host)
	vim.list_extend(argv, {
		"gerrit",
		"query",
		"--format=JSON",
		"--current-patch-set",
		"--patch-sets",
		"--comments",
		"change:" .. n,
	})

	local res = vim.system(argv, { text = true }):wait(30000)
	if not res or res.code ~= 0 then
		vim.notify("GerritComments: ssh query failed:\n" .. ((res and res.stderr) or "no output"), vim.log.levels.ERROR)
		return
	end

	local first = (res.stdout or ""):match("^[^\n]*") or ""
	local ok, change = pcall(vim.json.decode, first)
	if not ok or type(change) ~= "table" or change.type == "error" or not change.number then
		vim.notify("GerritComments: no change " .. n .. " found (or query error)", vim.log.levels.ERROR)
		return
	end

	open_scratch(render(change, n), n)
end

function M.setup()
	vim.api.nvim_create_user_command("GerritComments", function(cmd)
		M.show(cmd.args)
	end, { nargs = 1, desc = "Show all inline Gerrit comments for a change (all patch sets)" })
end

return M
