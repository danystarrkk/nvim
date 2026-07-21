require("nvchad.autocmds")

vim.api.nvim_create_autocmd("TermOpen", {
	group = vim.api.nvim_create_augroup("DisableSpellInTerm", { clear = true }),
	callback = function()
		vim.opt_local.spell = false
	end,
})
