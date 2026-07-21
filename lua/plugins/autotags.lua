return {
	"windwp/nvim-ts-autotag",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		opts = {
			enable_rename = true,
			enable_close = true,
			enable_close_on_slash = true,
		},
	},
}
