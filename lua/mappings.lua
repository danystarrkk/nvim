require("nvchad.mappings")

local map = vim.keymap.set

-- Comandos básicos
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Navegación y centro
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })

-- Manejo de buffers
map("n", "<leader>h", ":bprevious<CR>", { desc = "Buffer previous" })
map("n", "<leader>l", ":bNext<CR>", { desc = "Buffer next" })
map("n", "H", function()
	require("nvchad.tabufline").prev()
end, { desc = "Ir al buffer anterior" })
map("n", "L", function()
	require("nvchad.tabufline").next()
end, { desc = "Ir al siguiente buffer" })

-- Comentarios
map("v", "<leader>wc", "gc", { desc = "Toggle comment", remap = true })

-- Terminal y Explorador
pcall(vim.keymap.del, "n", "<A-i>")
pcall(vim.keymap.del, "t", "<A-i>")
map({ "n", "t" }, "<A-v>", "<cmd>resize -5<CR>", { desc = "Aumentar alto de terminal" })
map({ "n", "t" }, "<A-h>", "<cmd>resize +5<CR>", { desc = "Disminuir alto de terminal" })
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "Abrir/Cerrar Explorador" })
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Abrir/Cerrar Explorador" })

map("n", "<leader>gg", function()
	local Terminal = require("toggleterm.terminal").Terminal
	local lazygit = Terminal:new({
		cmd = "lazygit",
		direction = "float",
		hidden = true,
	})
	lazygit:toggle()
end, { desc = "Abrir Lazygit" })
