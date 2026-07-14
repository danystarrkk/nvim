return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        -- Mantenemos a php-cs-fixer como el encargado de PHP
        php = { "php_cs_fixer" },
      },
      formatters = {
        php_cs_fixer = {
          -- Le inyectamos la regla de oro (PSR-12) para que formatee llaves y espacios automáticamente
          prepend_args = { "--rules=@PSR12" },
        },
      },
    },
  },
}
