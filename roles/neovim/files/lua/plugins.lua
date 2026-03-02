-- Bootstrap lazy.nvim plugin manager (auto-installs on first run)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

require("lazy").setup({

	-- Automatically detect indent settings (tabs vs spaces, width) from file content
	"NMAC427/guess-indent.nvim",

	-- Colorscheme: Gruvbox with warm retro palette
	{
		"ellisonleao/gruvbox.nvim",
		opts = {},
		config = function(_, opts)
			require("gruvbox").setup(opts)
			vim.cmd.colorscheme("gruvbox")
		end,
	},

	-- Show git diff markers (+, ~, _) in the sign column
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			current_line_blame = true,
			current_line_blame_opts = {
				delay = 500,
				virt_text_pos = "eol",
			},
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},

	-- Telescope: fuzzy finder for files, grep, LSP symbols, buffers, and more
	{
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
		dependencies = {
			"nvim-lua/plenary.nvim", -- Required utility library
			{
				-- Native C fzf algorithm for faster filtering (needs `make`)
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
			-- Route vim.ui.select prompts (e.g. code actions) through Telescope
			{ "nvim-telescope/telescope-ui-select.nvim" },
			-- File-type icons in picker results (requires a Nerd Font)
			{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
		},
		config = function()
			require("telescope").setup({
				extensions = {
					-- Use a compact dropdown for vim.ui.select menus
					["ui-select"] = {
						require("telescope.themes").get_dropdown(),
					},
				},
			})

			-- Silently load optional extensions (no error if missing)
			pcall(require("telescope").load_extension, "fzf")
			pcall(require("telescope").load_extension, "ui-select")

			local builtin = require("telescope.builtin")

			-- Search/navigation keymaps (all under <leader>s or <leader>f namespace)
			vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
			vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
			vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
			vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
			vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
			vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
			vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
			vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = "[S]earch Recent Files" })
			vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "Find existing buffers" })

			-- Fuzzy search within the current buffer (compact dropdown, no preview)
			vim.keymap.set("n", "<leader>/", function()
				builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = false,
				}))
			end, { desc = "[/] Fuzzily search in current buffer" })

			-- Live grep restricted to currently open buffers
			vim.keymap.set("n", "<leader>s/", function()
				builtin.live_grep({
					grep_open_files = true,
					prompt_title = "Live Grep in Open Files",
				})
			end, { desc = "[S]earch [/] in Open Files" })

			-- Quick access to Neovim config files
			vim.keymap.set("n", "<leader>sn", function()
				builtin.find_files({ cwd = vim.fn.stdpath("config") })
			end, { desc = "[S]earch [N]eovim files" })
		end,
	},

	-- Provides Lua LSP completions/annotations for Neovim's API (vim.*, etc.)
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				-- Include luv (libuv) types when vim.uv is referenced
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},

	-- LSP: language server management, keymaps, diagnostics, and capabilities
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} }, -- Portable LSP/tool installer
			"mason-org/mason-lspconfig.nvim", -- Bridges Mason and lspconfig
			"WhoIsSethDaniel/mason-tool-installer.nvim", -- Declarative tool installation
			{ "j-hui/fidget.nvim", opts = {} }, -- LSP progress spinner in bottom-right
			"saghen/blink.cmp", -- Completion engine (provides capabilities)
		},
		config = function()
			-- Runs each time an LSP client attaches to a buffer
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
				callback = function(event)
					-- Helper: set a buffer-local keymap with "LSP: " prefix in desc
					local map = function(keys, func, desc, mode)
						mode = mode or "n"
						vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					-- Core LSP navigation and actions
					map("grn", vim.lsp.buf.rename, "[R]e[n]ame")
					map("gra", vim.lsp.buf.code_action, "[G]oto Code [A]ction", { "n", "x" })
					map("grr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
					map("gri", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
					map("grd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
					map("grD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
					map("gO", require("telescope.builtin").lsp_document_symbols, "Open Document Symbols")
					map("gW", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Open Workspace Symbols")
					map("grt", require("telescope.builtin").lsp_type_definitions, "[G]oto [T]ype Definition")

					-- Compat shim: supports_method API changed between nvim 0.10 and 0.11
					---@param client vim.lsp.Client
					---@param method vim.lsp.protocol.Method
					---@param bufnr? integer
					---@return boolean
					local function client_supports_method(client, method, bufnr)
						if vim.fn.has("nvim-0.11") == 1 then
							return client:supports_method(method, bufnr)
						else
							return client.supports_method(method, { bufnr = bufnr })
						end
					end

					local client = vim.lsp.get_client_by_id(event.data.client_id)

					-- Highlight all references to the symbol under cursor on CursorHold,
					-- clear them when cursor moves
					if
						client
						and client_supports_method(
							client,
							vim.lsp.protocol.Methods.textDocument_documentHighlight,
							event.buf
						)
					then
						local highlight_augroup =
							vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.document_highlight,
						})
						vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.clear_references,
						})
						vim.api.nvim_create_autocmd("LspDetach", {
							group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
							callback = function(event2)
								vim.lsp.buf.clear_references()
								vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
							end,
						})
					end

					-- Toggle inlay hints (type annotations, parameter names) if supported
					if
						client
						and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf)
					then
						map("<leader>th", function()
							vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
						end, "[T]oggle Inlay [H]ints")
					end
				end,
			})

			-- Diagnostic display settings
			vim.diagnostic.config({
				severity_sort = true,
				float = {
					border = "rounded",
					source = "always",
					max_width = 90,
					max_height = 20,
				},
				underline = { severity = vim.diagnostic.severity.ERROR },
				-- Nerd Font icons for sign column; falls back to no signs
				signs = vim.g.have_nerd_font and {
					text = {
						[vim.diagnostic.severity.ERROR] = "󰅚 ",
						[vim.diagnostic.severity.WARN] = "󰀪 ",
						[vim.diagnostic.severity.INFO] = "󰋽 ",
						[vim.diagnostic.severity.HINT] = "󰌶 ",
					},
				} or {},
				virtual_text = {
					source = "if_many",
					spacing = 2,
					format = function(diagnostic)
						local msg = diagnostic.message or ""
						msg = msg:gsub("%s+", " ") -- collapse whitespace/newlines

						local max_len = 80
						if #msg > max_len then
							msg = msg:sub(1, max_len - 1) .. "…"
						end

						return msg
					end,
				},
			})
			-- Keymap: show full diagnostic under cursor in a floating window
			vim.keymap.set("n", "<leader>e", function()
				vim.diagnostic.open_float(nil, { scope = "cursor", focus = false })
			end, { desc = "Show diagnostic (float)" })

			-- Merge blink.cmp's extra capabilities (snippets, etc.) into LSP client caps
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			-- Language servers to install and configure via Mason
			-- Keys: server name (must match lspconfig). Values: override table.
			-- Available overrides: cmd, filetypes, capabilities, settings
			local servers = {
				pyright = {},
				ansiblels = {
					filetypes = { "yaml.ansible", "ansible" },
				},
				lua_ls = {
					settings = {
						Lua = {
							completion = {
								callSnippet = "Replace",
							},
						},
					},
				},
				nil_ls = {
					settings = {
						["nil"] = {
							formatting = {
								command = { "nixfmt" },
							},
						},
					},
				},
			}

			-- Ensure all declared servers + extra tools are installed
			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(ensure_installed, {
				"stylua", -- Lua formatter
				"nixfmt", -- Nix formatter (used by nil_ls)
			})
			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			-- mason-lspconfig wires up Mason-installed servers to lspconfig automatically.
			-- The handler merges per-server overrides from the `servers` table above.
			require("mason-lspconfig").setup({
				ensure_installed = {},
				automatic_installation = false,
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						require("lspconfig")[server_name].setup(server)
					end,
				},
			})
		end,
	},

	-- Auto-format on save using external formatters, with LSP as fallback
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({ async = true, lsp_format = "fallback" })
				end,
				mode = "",
				desc = "[F]ormat buffer",
			},
		},
		opts = {
			notify_on_error = false,
			format_on_save = function(bufnr)
				-- Skip auto-format for languages without a standard style (add more as needed)
				local disable_filetypes = { c = true, cpp = true }
				if disable_filetypes[vim.bo[bufnr].filetype] then
					return nil
				else
					return {
						timeout_ms = 500,
						lsp_format = "fallback",
					}
				end
			end,
			formatters_by_ft = {
				lua = { "stylua" },
				terraform = { "tofu_fmt" },
			},
		},
	},

	-- Completion engine: fast, Rust-optional fuzzy matching with snippet support
	{
		"saghen/blink.cmp",
		event = "VimEnter",
		version = "1.*",
		dependencies = {
			{
				-- Snippet engine (powers snippet expansion from LSP and custom snippets)
				"L3MON4D3/LuaSnip",
				version = "2.*",
				build = (function()
					-- jsregexp needed for regex-based snippet transforms; skip on Windows or without make
					if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
						return
					end
					return "make install_jsregexp"
				end)(),
				opts = {},
			},
			"folke/lazydev.nvim",
		},
		--- @module 'blink.cmp'
		--- @type blink.cmp.Config
		opts = {
			keymap = {
				-- 'default': <c-y> accept, <c-n>/<c-p> navigate, <c-space> toggle menu,
				--            <tab>/<s-tab> jump in snippet, <c-e> dismiss, <c-k> signature
				preset = "default",
			},
			appearance = {
				nerd_font_variant = "mono", -- Use "normal" for non-Mono Nerd Font
			},
			completion = {
				-- Docs panel hidden by default; press <c-space> to show, or set auto_show = true
				documentation = { auto_show = false, auto_show_delay_ms = 500 },
			},
			sources = {
				default = { "lsp", "path", "snippets", "lazydev" },
				providers = {
					-- Boost lazydev completions above others for Neovim Lua editing
					lazydev = { module = "lazydev.integrations.blink", score_offset = 100 },
				},
			},
			snippets = { preset = "luasnip" },
			fuzzy = { implementation = "lua" }, -- "prefer_rust_with_warning" for faster native matcher
			signature = { enabled = true }, -- Show function signature as you type arguments
		},
	},

	-- Highlight TODO, FIXME, HACK, NOTE, etc. in comments with distinct colors
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},

	-- mini.nvim: collection of small, independent modules
	{
		"echasnovski/mini.nvim",
		config = function()
			-- Enhanced text objects: va), yinq, ci', din), etc.
			-- n_lines = 500 means it searches up to 500 lines for matching pairs
			require("mini.ai").setup({ n_lines = 500 })

			-- Minimal statusline showing mode, filename, diagnostics, location
			local statusline = require("mini.statusline")
			statusline.setup({ use_icons = vim.g.have_nerd_font })

			-- Override cursor position section to show LINE:COL format
			---@diagnostic disable-next-line: duplicate-set-field
			statusline.section_location = function()
				return "%2l:%-2v"
			end
		end,
	},
	{ "pearofducks/ansible-vim" },
	{ -- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		branch = "main",
		build = ":TSUpdate",
		config = function()
			local ts = require("nvim-treesitter")
			ts.setup()

			local parsers = {
				"bash",
				"c",
				"diff",
				"html",
				"lua",
				"luadoc",
				"markdown",
				"markdown_inline",
				"query",
				"vim",
				"vimdoc",
			}

			-- Actual filetypes for the parsers above.
			-- Injected parsers (luadoc, markdown_inline) don't need entries.
			local filetypes = {
				"sh",
				"c",
				"diff",
				"html",
				"lua",
				"markdown",
				"query",
				"vim",
				"help",
			}

			vim.defer_fn(function()
				ts.install(parsers):wait(300000)
			end, 0)

			vim.api.nvim_create_autocmd("FileType", {
				pattern = filetypes,
				callback = function()
					vim.treesitter.start()
				end,
			})

			local indent_exclude = { ruby = true, markdown = true }
			vim.api.nvim_create_autocmd("FileType", {
				pattern = filetypes,
				callback = function(event)
					if not indent_exclude[event.match] then
						vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
					end
				end,
			})
		end,
	},

	-- Render markdown files with rich formatting (headings, lists, code blocks)
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" },
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {},
	},

	-- File tree sidebar. Toggle with <leader>ft
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
		},
		config = function()
			require("nvim-tree").setup({})
			vim.keymap.set("n", "<leader>ft", ":NvimTreeToggle<CR>", { silent = true })
		end,
	},
}, {
	ui = {
		-- Nerd Font icons for Lazy UI, or unicode fallbacks
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})
