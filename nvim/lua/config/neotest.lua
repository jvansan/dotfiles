local M = {}

function M.setup()
	require("neotest").setup({
		adapters = {
			require("neotest-python")({
				runner = "pytest",
			})
		}
	})
end

return M
