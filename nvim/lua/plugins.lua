return {
	  -- colortheme
		{ "catppuccin/nvim",
			name = "catppuccin",
			priority = 1000,
      config = function()
        vim.cmd "colorscheme catppuccin"
      end,

		},
    --{
    --  "EdenEast/nightfox.nvim",
    --  config = function()
    --    vim.cmd "colorscheme nightfox"
    --  end,
    --},

		{
			"windwp/nvim-autopairs",
			event = "InsertEnter",
			opts = {} -- this is equalent to setup({}) function
		}
}
