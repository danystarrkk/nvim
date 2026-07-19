local nvlsp = require "nvchad.configs.lspconfig"

-- 1. Cargar las opciones estéticas por defecto de NvChad (UI de diagnósticos, íconos)
nvlsp.defaults()

-- 2. Configuración Global (El reemplazo de pasar capabilities a cada setup)
-- Usamos el comodín "*" para aplicar estas opciones a todos los servidores LSP
vim.lsp.config("*", {
  capabilities = nvlsp.capabilities,
  on_init = nvlsp.on_init,
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    -- 1. NvChad ejecuta sus configuraciones nativas (y enciende su firma secreta)
    nvlsp.on_attach(client, args.buf)

    -- 2. El "Asesino Silencioso": Programamos la destrucción inmediata de los
    -- eventos de firma de NvChad únicamente para este archivo (buffer).
    vim.schedule(function()
      -- Borramos los eventos que causan el robo de foco (error E21)
      pcall(vim.api.nvim_clear_autocmds, { group = "nvchad_signature", buffer = args.buf })
      pcall(vim.api.nvim_clear_autocmds, { group = "NvChadSignature", buffer = args.buf })
    end)
  end,
})

-- 5. Habilitar los servidores usando la nueva API nativa
vim.lsp.enable {
  "html",
  "cssls",
  "ts_ls",
  "intelephense",
  "clangd", -- C/C++
  "dockerls", -- Docker
  "jsonls", -- JSON
  "marksman", -- Markdown
  "pyright", -- Python
  "tailwindcss", -- Tailwind
  "taplo", -- TOML
  "emmet_language_server",
  "bashls", -- Bash
  "gopls", -- Go
}
