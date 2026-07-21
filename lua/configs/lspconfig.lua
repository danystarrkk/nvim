local nvlsp = require("nvchad.configs.lspconfig")

nvlsp.defaults()

local servers_without_formatting = { "ts_ls", "html", "cssls", "jsonls", "intelephense", "clangd" }

local custom_on_attach = function(client, bufnr)
	nvlsp.on_attach(client, bufnr)

	if vim.tbl_contains(servers_without_formatting, client.name) then
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false
	end
end

vim.lsp.config("*", {
	capabilities = nvlsp.capabilities,
	on_init = nvlsp.on_init,
	on_attach = custom_on_attach,
})

vim.lsp.enable({
	"html",
	"cssls",
	"ts_ls",
	"intelephense",
	"clangd",
	"dockerls",
	"jsonls",
	"marksman",
	"pyright",
	"tailwindcss",
	"taplo",
	"emmet_language_server",
	"bashls",
	"gopls",
})
