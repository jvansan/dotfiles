vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Comment plugin
  use({"tpope/vim-commentary", event = "VimEnter"})

  -- Colorscheme section
  use("gruvbox-community/gruvbox")

  -- tmuxconf syntax
  use({ "tmux-plugins/vim-tmux", ft = { "tmux" } })

  --rainbow paren matching
  use({
    "luochen1990/rainbow",
    config = function()
      vim.g.rainbow_active = 1
    end
  })

  -- show and trim trailing whitespaces
  use {'jdhao/whitespace.nvim', event = 'VimEnter'}

end)
