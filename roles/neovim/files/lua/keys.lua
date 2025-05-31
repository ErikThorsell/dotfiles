local map = vim.keymap.set
local opts = { noremap = true, silent = true, nowait = true }

-- Leader
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Leader mappings
map("n", "<leader>p", "gqap", opts)
map("n", "<leader>s", "gqas", opts)
map("n", "<leader>c", ":set cursorline! cursorcolumn!<CR>", opts)

-- New tab (prompt for file)
map("n", "<C-t>", ":tabedit ", { noremap = true, silent = false })

-- Open file under cursor
map("n", "gF", ":edit <cfile><CR>", opts)
map("n", "gf", ":tabedit <cfile><CR>", opts)

-- Search navigation
map("n", "m", "n", opts)
map("n", "M", "N", opts)

-- [ Dvorak cursor motion ]

-- Remove anything related to h and s to ensure there's no lag
local modes = { "n", "v", "s", "o" }
for _, mode in ipairs(modes) do
	pcall(vim.keymap.del, mode, "h")
	pcall(vim.keymap.del, mode, "s")
end

map(modes, "h", "h", opts)
map(modes, "t", "j", opts)
map(modes, "n", "k", opts)
map(modes, "s", "l", opts)

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
