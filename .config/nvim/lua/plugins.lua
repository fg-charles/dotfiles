-- Sets up lazy.nvim

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

-- Install plugins
require("lazy").setup({
	'tpope/vim-fugitive',
	'lukas-reineke/indent-blankline.nvim',
	'lewis6991/gitsigns.nvim',
	"nvim-treesitter/nvim-treesitter",
	"aktersnurra/no-clown-fiesta.nvim",
	"rose-pine/neovim",
	'nvim-lualine/lualine.nvim',
	"https://git.sr.ht/~p00f/cphelper.nvim",
	-- Lsp/Dap stuff
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	{
		'hrsh7th/nvim-cmp',
		dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
	},
	--
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		opts = {}
	},
	{
		'nvim-telescope/telescope.nvim',
		version = '*',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	{
		'nvim-telescope/telescope-fzf-native.nvim',
		build = 'make',
	},
	{
		'xeluxee/competitest.nvim',
		dependencies = 'MunifTanjim/nui.nvim',
		config = function() require('competitest').setup() end,
	},
	{
		"kawre/leetcode.nvim",
		build = ":TSUpdate html",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim", -- required by telescope
			"MunifTanjim/nui.nvim",

			-- optional
			"nvim-treesitter/nvim-treesitter",
			"rcarriga/nvim-notify",
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			injector = {
				['cpp'] = { 
					before = { '#include <bits/stdc++.h>', 'using namespace std;' }
				}
			}
		},
	}
})

-- Configure Plugins
require('no-clown-fiesta').setup{ transparent = true }
vim.cmd.colorscheme('no-clown-fiesta')

require('lualine').setup {
	options = {
		icons_enabled = true,
		theme = 'auto',
		component_seperators = '|',
		section_seperators = ''
	}
}

require('gitsigns').setup {
	signs = {
		add = { text = '+' },
		change = { text = '~' },
		delete = { text = '_' },
		topdelete = { text = '‾' },
		changedelete = { text = '~' },
	},
	on_attach = function(bufnr)
		vim.keymap.set('n', '[c', require('gitsigns').prev_hunk, { buffer = bufnr })
		vim.keymap.set('n', ']c', require('gitsigns').next_hunk, { buffer = bufnr })
	end,
}

require("mason").setup()

require("mason-lspconfig").setup {
	automatic_installation = true,
}
