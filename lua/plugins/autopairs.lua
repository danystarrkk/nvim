return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  config = function()
    local autopairs = require "nvim-autopairs"

    autopairs.setup {
      check_ts = true, -- Usa Treesitter para detectar si estás en un string/comentario
      ts_config = {
        lua = { "string" },
        javascript = { "template_string" },
        typescriptreact = { "template_string" }, -- Vital para tus archivos .tsx
      },
      disable_filetype = { "TelescopePrompt" },
      fast_wrap = {
        map = "<M-e>", -- Alt+e para envolver texto seleccionado
        chars = { "{", "[", "(", '"', "'" },
      },
    }
  end,
}
