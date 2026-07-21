return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	lazy = false,
	version = false,
	build = "make",
	opts = {
		provider = "deepseek_ninja",
		providers = {
			deepseek_ninja = {
				__inherited_from = "openai",
				endpoint = "https://integrate.api.nvidia.com/v1",
				model = "deepseek-ai/deepseek-v4-flash",
				api_key_name = "NVIDIA_API_KEY",
			},
		},
		mode = "agentic",
		behaviour = {
			auto_suggestions = false,
			auto_focus_sidebar = false,
			auto_approve_tool_permissions = false,
		},
		mappings = {
			sidebar = {
				apply_all = "A",
				apply_cursor = "a",
				switch_windows = "<C-j>",
				reverse_switch_windows = "<C-k>",
			},
		},
	},
	dependencies = {
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
		{
			"HakonHarnes/img-clip.nvim",
			event = "VeryLazy",
			opts = {
				default = {
					embed_image_as_base64 = false,
					prompt_for_file_name = false,
					drag_and_drop = { insert_mode = true },
					use_absolute_path = true,
				},
			},
		},
		{
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				file_types = { "markdown", "Avante" },
			},
			ft = { "markdown", "Avante" },
		},
	},
}
