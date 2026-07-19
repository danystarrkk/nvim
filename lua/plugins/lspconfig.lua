return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require "configs.lspconfig" -- Esto carga tu configuración de servidores
  end,
}
