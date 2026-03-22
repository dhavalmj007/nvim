local ok, configs = pcall(require, "nvim-treesitter.configs")
if not ok then
	return
end

configs.setup({
	ensure_installed = {
		"c",
		"lua",
		"vim",
		"vimdoc",
		"query",
		"python",
		"typescript",
		"javascript",
		"java",
		"json",
		"markdown",
		"html",
		"css",
	},

	sync_install = false,
	auto_install = true,

	ignore_install = {},

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},

	indent = {
		enable = true,
	},

	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	},
})

-- Ensure parsers are available for telescope
local status_ok, _ = pcall(require, "nvim-treesitter.parsers")
if status_ok then
	require("nvim-treesitter.parsers").get_parser_configs()
end
