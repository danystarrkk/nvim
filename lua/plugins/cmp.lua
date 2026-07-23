return {
	{
		"hrsh7th/nvim-cmp",
		opts = function(_, opts)
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			opts.completion = vim.tbl_deep_extend("force", opts.completion or {}, {
				autocomplete = { require("cmp.types").cmp.TriggerEvent.TextChanged },
			})

			opts.mapping = vim.tbl_deep_extend("force", opts.mapping, {
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<C-k>"] = cmp.mapping.select_prev_item(),

				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.confirm({ select = true })
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { "i", "s" }),

				["<S-Tab>"] = cmp.mapping(function(fallback)
					if luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),

				["<C-Space>"] = cmp.mapping.complete(),

				["<CR>"] = cmp.config.disable,
			})

			return opts
		end,
	},
}
