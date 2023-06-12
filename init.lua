-- Packer bootstrap
require('packer').startup(function()
    use {
       "nvim-neo-tree/neo-tree.nvim",
       branch = "v2.x",
       requires = {
           "nvim-lua/plenary.nvim",
           "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
	   "MunifTanjim/nui.nvim",
       }
    }
    use 'windwp/nvim-autopairs'
    use 'tpope/vim-commentary'
    use 'nyoom-engineering/oxocarbon.nvim'
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
    }
    use {
       'nvim-lualine/lualine.nvim',
       requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    -- barbar
    use 'nvim-tree/nvim-web-devicons' -- OPTIONAL: for file icons
    use 'lewis6991/gitsigns.nvim' -- OPTIONAL: for git status
    use 'romgrk/barbar.nvim'
    -- language servers
    use {
  	'hrsh7th/nvim-cmp',
  	requires = {
    		'hrsh7th/cmp-nvim-lsp',
    		'hrsh7th/cmp-buffer',
    		'hrsh7th/cmp-path',
  	},
    }
    use 'neovim/nvim-lspconfig'
    use {
       "williamboman/mason.nvim",
       run = ":MasonUpdate" -- :MasonUpdate updates registry contents
    }
    -- terminal
    use "akinsho/toggleterm.nvim"
    use 'nyoom-engineering/oxocarbon.nvim'
end)

-- Toggleterm configuration
require('toggleterm').setup {
  open_mapping = [[<A-i>]], -- Keybinding to toggle the terminal
  direction = 'float',
  shell = vim.o.shell,
  float_opts = {
      border = 'single',
  },
}

-- Lsp config
local cmp = require('cmp')
cmp.setup {
  mapping = {
	['<CR>'] = function(fallback)
        	if cmp.visible() then
          		cmp.confirm()
        	else
          		fallback() -- If you use vim-endwise, this fallback will behave the same as vim-endwise.
        	end
        end,
	['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
	['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
  },
}
local lspconfig = require('lspconfig')
lspconfig.clangd.setup{}
lspconfig.pyright.setup{}
-- lspconfig.sumneko_lua.setup{}

-- Mason setup
require("mason").setup()

-- Tree sitter configuration
require('nvim-treesitter.configs').setup {
  ensure_installed = {
	  "c",
	  "lua",
	  "python",
  },
  highlight = {
	enable = true,
  },
}

-- Lua line configurations
require('lualine').setup()

-- Configure autopairs
require('nvim-autopairs').setup({
    disable_filetype = { "TelescopePrompt" },
    ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]],'%s+', ''),
    enable_check_bracket_line = true,
})

-- Barbar keybinds
vim.api.nvim_set_keymap('n', '<S-Tab>', '<Cmd>BufferPrevious<CR>', { silent = true })
vim.api.nvim_set_keymap('n', 'Tab>', '<Cmd>BufferNext<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<A-0>', '<Cmd>BufferLast<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<Space>x', '<Cmd>BufferClose<CR>', { silent = true })
-- vim.api.nvim_set_keymap('n', '', '<Cmd>BufferRestore<CR>', { silent = true })

-- Color theme
vim.opt.background = "dark" -- set this to dark or light
vim.cmd("colorscheme gruvbox")

-- Mappping saving and exiting
vim.api.nvim_set_keymap('n', '<C-q>', ':qa<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', { silent = true })

-- Relative line munber
vim.wo.scrolloff = 5
vim.opt.number = true
vim.opt.relativenumber = true

-- Commenting
vim.api.nvim_set_keymap('n', '<Space>/', ':Commentary<CR>', { silent = true })
vim.api.nvim_set_keymap('v', '<Space>/', ':Commentary<CR>', { silent = true })

-- Ctrl + movement keys
vim.api.nvim_set_keymap('v', '<C-j>', '<Down>', { noremap = true })
vim.api.nvim_set_keymap('v', '<C-k>', '<Up>', { noremap = true })
vim.api.nvim_set_keymap('v', '<C-l>', '<Right>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { silent = true })

-- Neotree open
vim.api.nvim_set_keymap('n', '<Space>e', ':Neotree<CR>', { silent = true })
