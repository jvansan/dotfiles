local M = {}


function M.setup()
  -- Indicate first time installation
  local packer_bootstrap = false

  -- packer.nvim configuration
  local conf = {
		profile = {
			enable = true,
			threshold = 0,
		},
    display = {
      open_fn = function()
        return require("packer.util").float { border = "rounded" }
      end,
    },
  }

  -- Check if packer.nvim is installed
  -- Run PackerCompile if there are changes in this file
  local function packer_init()
    local fn = vim.fn
    local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
      packer_bootstrap = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
      }
      vim.cmd [[packadd packer.nvim]]
    end
    vim.cmd "autocmd BufWritePost plugins.lua source <afile> | PackerCompile"
  end

  -- Plugins
  local function plugins(use)
    use { "wbthomason/packer.nvim" }

    -- Treesitter
    use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      config = function()
        require("config.treesitter").setup()
      end,
      requires = {
        { "nvim-treesitter/nvim-treesitter-textobjects" },
        { "p00f/nvim-ts-rainbow" },
      },
    }

    -- Colorscheme
    use {
      "EdenEast/nightfox.nvim",
      config = function()
        vim.cmd "colorscheme nightfox"
      end,
    }

		-- Load only when require
    use { "nvim-lua/plenary.nvim", module = "plenary" }

		-- Better Netrw
		use {"tpope/vim-vinegar"}

		-- WhichKey
		use {
			 "folke/which-key.nvim",
			 event = "VimEnter",
			 config = function()
				 require("config.whichkey").setup()
			 end,
		}

    -- IndentLine
    use {
      "lukas-reineke/indent-blankline.nvim",
      event = "BufReadPre",
      config = function()
        require("config.indentblankline").setup()
      end,
    }

    -- Better icons
    use {
      "kyazdani42/nvim-web-devicons",
      module = "nvim-web-devicons",
      config = function()
        require("nvim-web-devicons").setup { default = true }
      end,
    }

    -- Better Comment
    use {
      "numToStr/Comment.nvim",
      opt = true,
      keys = { "gc", "gcc", "gbc" },
      config = function()
        require("Comment").setup {}
      end,
    }

    -- Easy hopping
    use {
      "phaazon/hop.nvim",
      cmd = { "HopWord", "HopChar1" },
      config = function()
        require("hop").setup {}
      end,
    }

    -- Easy motion
    use {
      "ggandor/lightspeed.nvim",
      keys = { "s", "S", "f", "F", "t", "T" },
      config = function()
        require("lightspeed").setup {}
      end,
    }

		use {
			"hrsh7th/nvim-cmp",
			event = "InsertEnter",
			opt = true,
			config = function()
				require("config.cmp").setup()
			end,
			wants = { "LuaSnip" },
			requires = {
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
				"hrsh7th/cmp-nvim-lua",
				"ray-x/cmp-treesitter",
				"hrsh7th/cmp-cmdline",
				"saadparwaiz1/cmp_luasnip",
				"hrsh7th/cmp-nvim-lsp",
				{
					"L3MON4D3/LuaSnip",
					wants = {"friendly-snippets", "vim-snippets"},
					config = function()
						require("config.luasnip").setup()
					end,
				},
				"rafamadriz/friendly-snippets",
				"honza/vim-snippets",
				disable = false,
			},
		}

		-- Auto pairs
		use {
			"windwp/nvim-autopairs",
			wants = "nvim-treesitter",
			module = { "nvim-autopairs.completion.cmp", "nvim-autopairs" },
			config = function()
				require("config.autopairs").setup()
			end,
		}

		-- End wise
			use {
				"RRethy/nvim-treesitter-endwise",
				wants = "nvim-treesitter",
				event = "InsertEnter",
			}

		--	LSP
		use {
			"neovim/nvim-lspconfig",
			opt = true,
			event = "BufReadPre",
			wants = { "cmp-nvim-lsp", "nvim-lsp-installer", "lsp_signature.nvim" }, -- for nvim-cmp
			config = function()
				require("config.lsp").setup()
			end,
			requires = {
				"williamboman/nvim-lsp-installer",
				"ray-x/lsp_signature.nvim",
			}
		}

		-- Telescope
		use {
			"nvim-telescope/telescope.nvim",
			opt = true,
			config = function()
				require("config.telescope").setup()
			end,
			cmd = { "Telescope" },
			module = "telescope",
			keys = { "<leader>f", "<leader>p" },
			wants = {
				"plenary.nvim",
				"popup.nvim",
				"telescope-fzf-native.nvim",
				"telescope-project.nvim",
				"telescope-repo.nvim",
				"telescope-file-browser.nvim",
				"project.nvim",
			},
			requires = {
				"nvim-lua/popup.nvim",
				"nvim-lua/plenary.nvim",
				{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
				"nvim-telescope/telescope-project.nvim",
				"cljoly/telescope-repo.nvim",
				"nvim-telescope/telescope-file-browser.nvim",
				{
					"ahmedkhalf/project.nvim",
					config = function()
						require("project_nvim").setup {}
					end,
				},
			},
		}

    if packer_bootstrap then
      print "Restart Neovim required after installation!"
      require("packer").sync()
    end
  end

  packer_init()

  local packer = require "packer"
  packer.init(conf)
  packer.startup(plugins)
end

return M
