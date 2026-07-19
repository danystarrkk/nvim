require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Tus nuevos mapeos migrados:

-- Mantener el cursor en el centro al hacer scroll
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })

-- Moverse entre buffers
map("n", "<leader>h", ":bprevious<CR>", { desc = "Buffer previous" })
map("n", "<leader>l", ":bNext<CR>", { desc = "Buffer next" })

-- Auto comment (usando la función nativa de Neovim 'gc' para el modo visual)
map("v", "<leader>wc", "gc", { desc = "Toggle comment", remap = true })

-- Navegar a la izquierda (Shift + H)
map("n", "H", function()
  require("nvchad.tabufline").prev()
end, { desc = "Ir al buffer anterior" })

-- Navegar a la derecha (Shift + L)
map("n", "L", function()
  require("nvchad.tabufline").next()
end, { desc = "Ir al siguiente buffer" })

-- Desactivar únicamente la terminal flotante nativa de NvChad para evitar que salga por accidente
pcall(vim.keymap.del, "n", "<A-i>")
pcall(vim.keymap.del, "t", "<A-i>")

-- Sobrescribir <A-v> y <A-h> para redimensionar la terminal de Toggleterm
-- Funcionará tanto si el cursor está en el código (n) como si estás escribiendo en la consola (t)
vim.keymap.set({ "n", "t" }, "<A-v>", "<cmd>resize -5<CR>", { desc = "Aumentar alto de terminal" })
vim.keymap.set({ "n", "t" }, "<A-h>", "<cmd>resize +5<CR>", { desc = "Disminuir alto de terminal" })

local map = vim.keymap.set
-- Forzar que Ctrl + n abra y cierre el árbol
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "Abrir/Cerrar Explorador" })

-- Sobrescribir leader + e para que también abra y cierre (en lugar de solo enfocar)
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Abrir/Cerrar Explorador" })
