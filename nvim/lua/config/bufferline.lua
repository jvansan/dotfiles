local M = {}

function M.setup()
	require("bufferline").setup {
		options = {
			mode = "buffers",
			separator_style = "slant",
		}
	}
end

return M
