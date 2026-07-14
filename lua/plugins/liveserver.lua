return {
  {
    "barrett-ruth/live-server.nvim", -- (Asegúrate de que este sea el nombre de tu plugin)
    cmd = { "LiveServerStart", "LiveServerStop" },

    keys = {
      -- Atajos de teclado integrados con la tecla Leader (Espacio por defecto en LazyVim)
      { "<leader>ls", "<cmd>LiveServerStart<cr>", desc = "Iniciar Live Server" },
      { "<leader>lx", "<cmd>LiveServerStop<cr>", desc = "Detener Live Server" },
    },
    init = function()
      vim.g.live_server = {
        port = 5000,
      }
    end,
  },
}
