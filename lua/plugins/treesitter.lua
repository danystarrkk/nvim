return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate", -- Asegura que se ejecute la actualización al instalar
  opts = {
    ensure_installed = {
      "vim",
      "lua",
      "vimdoc",
      "html",
      "css",
      "javascript",
      "typescript",
      "tsx",
      "php",
      "sql",
      "json",
      "markdown",
      "markdown_inline",
      "c",
      "cpp",
      "dockerfile",
      "jsonc",
      "python",
      "toml",
    },

    -- AGREGA ESTAS LÍNEAS PARA EVITAR EL ERROR DE COMPILACIÓN:
    sync_install = true, -- Instala de forma síncrona para ver errores
    auto_install = false, -- IMPORTANTE: Desactiva la compilación automática

    highlight = {
      enable = true,
      use_languagetree = true,
      additional_vim_regex_highlighting = false,
    },
    spell = { enable = true },
    indent = { enable = true },
  },
}
