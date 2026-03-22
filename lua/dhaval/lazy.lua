local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		-- Master branch is required for Neovim 0.11+
		dependencies = { { "nvim-lua/plenary.nvim" } },
	},

	-- Rose-pine colorscheme
	{
		"rose-pine/neovim",
		name = "rose-pine",
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},

	-- Harpoon
	"theprimeagen/harpoon",

	-- Undotree
	"mbbill/undotree",

	-- Fugitive
	"tpope/vim-fugitive",

	-- Modern LSP Setup (without lsp-zero)
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
		},
	},

	-- Autocompletion
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
	},

	-- Sneak
	"justinmk/vim-sneak",

	-- Zen Mode
	"folke/zen-mode.nvim",

	-- Lualine
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	-- Surround
	"tpope/vim-surround",

	-- Autopairs
	"windwp/nvim-autopairs",

	-- Autotag
	"windwp/nvim-ts-autotag",

	-- Web Devicons
	"kyazdani42/nvim-web-devicons",

	-- LSPSaga
	{
		"nvimdev/lspsaga.nvim",
		dependencies = { "neovim/nvim-lspconfig" },
	},

	-- Bufferline
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
	},

	-- Formatter
	"mhartington/formatter.nvim",

	-- Emmet
	"mattn/emmet-vim",

	-- Colorizer
	"NvChad/nvim-colorizer.lua",

	-- Which Key
	{
		"folke/which-key.nvim",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
	},

	-- Gitsigns
	"lewis6991/gitsigns.nvim",

	-- Comment.nvim
	{
		"numToStr/Comment.nvim",
	},

	-- Debugging Tools
	"mfussenegger/nvim-dap",
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
	},
	"folke/neodev.nvim",
	{
		"mxsdev/nvim-dap-vscode-js",
		dependencies = { "mfussenegger/nvim-dap" },
	},
	{
		"microsoft/vscode-js-debug",
		lazy = true,
		build = "npm install --legacy-peer-deps --ignore-scripts && npx gulp vsDebugServerBundle && mv dist out",
	},
	"mfussenegger/nvim-dap-python",

	-- OSC52
	"ojroques/nvim-osc52",

	"supermaven-inc/supermaven-nvim",
})
