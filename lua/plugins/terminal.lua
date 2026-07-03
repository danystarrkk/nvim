return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      open_mapping = [[<C-t>]],
      shell = "zsh",
      direction = "horizontal",
      size = 15,
      shade_terminals = true,
      shading_factor = 2,
      float_opts = {
        border = "curved",
        winblend = 3,
      },
    },
    keys = {
      -- Terminales básicas y comodín flotante
      { "<C-t>", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal Global" },
      { "<leader>t1", "<cmd>1ToggleTerm<cr>", desc = "Terminal 1" },
      { "<leader>t2", "<cmd>2ToggleTerm<cr>", desc = "Terminal 2" },
      { "<leader>t3", "<cmd>3ToggleTerm<cr>", desc = "Terminal 3" },
      { "<leader>t4", "<cmd>4ToggleTerm<cr>", desc = "Terminal 4" },
      { "<leader>tf", "<cmd>5ToggleTerm direction=float<cr>", desc = "Terminal Flotante" },

      -- Doble Escape para salir al modo normal (solo en modo terminal)
      { "<Esc><Esc>", "<C-\\><C-n>", mode = "t", desc = "Entrar a modo normal en terminal" },

      -- Redimensionar con Espacio + j / k (en modo normal)
      { "<leader>k", "<cmd>resize +2<cr>", mode = "n", desc = "Aumentar altura de ventana" },
      { "<leader>j", "<cmd>resize -2<cr>", mode = "n", desc = "Reducir altura de ventana" },
    },
  },
}
