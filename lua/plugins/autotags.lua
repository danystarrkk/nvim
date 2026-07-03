return {
  {
    "windwp/nvim-ts-autotag",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      -- Configuración interna del plugin para activar el renombrado dinámico
      opts = {
        enable_rename = true, -- Activa el auto-renombrado automático de la etiqueta pareja
        enable_close = true, -- Cierra la etiqueta automáticamente al escribir '>'
        enable_close_on_slash = true, -- Cierra la etiqueta si escribes '/' dentro de una apertura
      },
      -- Opcional: si quieres afinar en qué lenguajes actúa
      per_filetype = {
        ["html"] = {
          enable_close = true,
          enable_rename = true,
        },
        ["javascriptreact"] = {
          enable_close = true,
          enable_rename = true,
        },
        ["typescriptreact"] = {
          enable_close = true,
          enable_rename = true,
        },
        ["php"] = {
          enable_close = true,
          enable_rename = true,
        },
      },
    },
  },
}
