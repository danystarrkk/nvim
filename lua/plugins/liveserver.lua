return {
  "barrett-ruth/live-server.nvim",
  -- Instala automáticamente el servidor global de npm si no lo tienes
  build = "npm i -g live-server",
  -- Carga el plugin solo cuando llames a sus comandos
  cmd = { "LiveServerStart", "LiveServerStop" },
  keys = {
    -- Atajos de teclado integrados con la tecla Leader (Espacio por defecto en LazyVim)
    { "<leader>ls", "<cmd>LiveServerStart<cr>", desc = "Iniciar Live Server" },
    { "<leader>lx", "<cmd>LiveServerStop<cr>", desc = "Detener Live Server" },
  },
  opts = {
    -- Aquí puedes pasarle argumentos al servidor si lo necesitas
    args = { "--port=5500", "--browser=default" },
  },
}
