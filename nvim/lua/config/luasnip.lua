local M = {}

function M.setup()
  local luasnip = require "luasnip"

  luasnip.config.set_config {
    history = false,
    updateevents = "TextChanged,TextChangedI",
  }

  require("luasnip/loaders/from_vscode").lazy_load()
	require("luasnip.loaders.from_snipmate").lazy_load()

end

return M
