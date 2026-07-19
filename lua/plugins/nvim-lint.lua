return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  var = "configuraicon",
  config = function()
    local lint = require "lint"

    -- Configuramos los linters por lenguaje
    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescript = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      php = { "phpstan" },
    }

    -- Lógica condicional: Solo ejecutar eslint_d si existe configuración
    lint.linters.eslint_d.condition = function(ctx)
      local config_files = { ".eslintrc", ".eslintrc.js", ".eslintrc.json", "eslint.config.js" }
      local found = vim.fs.find(config_files, { path = ctx.filename, upward = true })
      return #found > 0
    end

    -- Lógica condicional: Solo ejecutar phpstan si existe configuración
    lint.linters.phpstan.condition = function(ctx)
      local config_files = { "phpstan.neon", "phpstan.neon.dist" }
      local found = vim.fs.find(config_files, { path = ctx.filename, upward = true })
      return #found > 0
    end

    -- Auto-comando para ejecutar el linter al guardar o salir del modo insertar
    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
