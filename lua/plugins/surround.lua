return {
  "kylechui/nvim-surround",
  version = "*", -- Usar la última versión estable
  event = "VeryLazy",
  config = function()
    require("nvim-surround").setup {
      -- Los atajos por defecto son tan buenos que rara vez necesitan cambiarse,
      -- pero podemos agregar reglas específicas para etiquetas HTML/React aquí si las necesitas.
    }
  end,
}
