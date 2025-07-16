return {
	"code-biscuits/nvim-biscuits",
	requires = {
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	},
	keys = {
		{
			"<leader>bb",
			function()
				require("nvim-biscuits").BufferAttach()
			end,
			mode = "n",
			desc = "Enable Biscuits",
		},
	},
}
