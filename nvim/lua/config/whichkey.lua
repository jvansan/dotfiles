local M = {}

function M.setup()
  local whichkey = require "which-key"

  local conf = {
    window = {
      border = "single", -- none, single, double, shadow
      position = "bottom", -- bottom, top
    },
  }

  local opts = {
    mode = "n", -- Normal mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
  }

  local mappings = {
    ["w"] = { "<cmd>update!<CR>", "Save" },
    ["q"] = { "<cmd>q!<CR>", "Quit" },

    b = {
      name = "Buffer",
			n = { "<Cmd>bn<Cr>", "Go to next buffer"},
			p = { "<Cmd>bp<Cr>", "Go to previous buffer"},
      c = { "<Cmd>bd!<Cr>", "Close current buffer" },
      D = { "<Cmd>%bd|e#|bd#<Cr>", "Delete all buffers" },
    },

    z = {
      name = "Packer",
      c = { "<cmd>PackerCompile<cr>", "Compile" },
      i = { "<cmd>PackerInstall<cr>", "Install" },
      s = { "<cmd>PackerSync<cr>", "Sync" },
      S = { "<cmd>PackerStatus<cr>", "Status" },
      u = { "<cmd>PackerUpdate<cr>", "Update" },
      p = { "<cmd>PackerProfile<cr>", "Profile" },
    },

    g = {
      name = "Git",
      s = { "<cmd>Neogit<CR>", "Status" },
    },
		
		f = {
			name = "Find",
			f = { "<cmd>lua require('utils.finder').find_files()<cr>", "Files" },
			d = { "<cmd>lua require('utils.finder').find_dotfiles()<cr>", "Dotfiles" },
			b = { "<cmd>Telescope buffers<cr>", "Buffers" },
			o = { "<cmd>Telescope oldfiles<cr>", "Old Files" },
			g = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
			c = { "<cmd>Telescope commands<cr>", "Commands" },
			r = { "<cmd>Telescope file_browser<cr>", "Browser" },
			w = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Current Buffer" },
			e = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
		},

		p = {
			name = "Project",
			p = { "<cmd>lua require'telescope'.extensions.project.project{}<cr>", "List" },
			s = { "<cmd>Telescope repo list<cr>", "Search" },
		},

		},
  }

  whichkey.setup(conf)
  whichkey.register(mappings, opts)
end

return M
