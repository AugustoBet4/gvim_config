return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufnewFile" },
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ignore_install = {},
				auto_install = true,
				ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
				sync_install = false,
				modules = {
					"highlight",
					"incremental_selection",
					"indent",
				},
				highlight = { enable = true },
				indent = { enable = true }
			})
		end
	},
	{
		-- Show delimiters in alternating colors
		"HiPhish/rainbow-delimiters.nvim",
	},
	{
		-- Show code context (fixing scope lines to the top)
		"nvim-treesitter/nvim-treesitter-context",
	}
}
