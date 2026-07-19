return {
  "akinsho/toggleterm.nvim",
  version = "*",
  event = "VeryLazy",
  config = function()
    require("toggleterm").setup {
      open_mapping = nil,
      direction = "horizontal",
      size = 15,
    }

    local Terminal = require("toggleterm.terminal").Terminal

    -- Inicializamos las 4 instancias de terminal independientes
    local t1 = Terminal:new { id = 1, direction = "horizontal" }
    local t2 = Terminal:new { id = 2, direction = "horizontal" }
    local t3 = Terminal:new { id = 3, direction = "horizontal" }
    local t4 = Terminal:new { id = 4, direction = "horizontal" }

    -- Asignamos los atajos para abrir/cerrar cada una
    vim.keymap.set("n", "<leader>t1", function()
      t1:toggle()
    end, { desc = "Toggle Terminal 1" })

    vim.keymap.set("n", "<leader>t2", function()
      t2:toggle()
    end, { desc = "Toggle Terminal 2" })

    vim.keymap.set("n", "<leader>t3", function()
      t3:toggle()
    end, { desc = "Toggle Terminal 3" })

    vim.keymap.set("n", "<leader>t4", function()
      t4:toggle()
    end, { desc = "Toggle Terminal 4" })

    -- Atajo general de ToggleTerm (respeta la numeración si usas prefijos numéricos)
    vim.keymap.set({ "n", "t" }, "<C-t>", '<cmd>exe v:count1 . "ToggleTerm"<cr>', { desc = "Ocultar/Toggle Terminal" })
  end,
}
