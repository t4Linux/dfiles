return {
	{
		"folke/noice.nvim",
		event = "VeryLazy",

		opts = {
			views = {
				cmdline_popup = {
					position = "50%",
				},
				cmdline_popupmenu = {
					position = "50%",
				},
			},
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},
}
