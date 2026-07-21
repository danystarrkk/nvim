require("nvchad.options")

vim.opt.spell = true
vim.opt.spelllang = { "es", "en" }
vim.opt.relativenumber = true

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		local arg = vim.fn.argv(0)
		if arg ~= "" and vim.fn.isdirectory(arg) == 1 then
			vim.cmd("cd " .. vim.fn.escape(arg, " \\"))
		end
	end,
})
