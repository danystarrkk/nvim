local keymapc = vim.api.nvim_set_keymap
local keymap = vim.keymap.set

--global keymaps

keymapc("i", "jk", "<ESC>", { noremap = true }) --Esc
-- Live-server
keymap("n", "<leader>ws", ":LiveServerStart<CR>")
keymap("n", "<leader>wt", ":LiveServerStop<CR>")

-- LoremIps
keymap("n", "<leader>wl", ":LoremIpsum")

-- Auto comments visual line
keymap("v", "<leader>wc", ":'<,'>CommentToggle<CR>")
