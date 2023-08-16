-- Packer bootstrap
require('packer').startup(function()
    use "lukas-reineke/indent-blankline.nvim"
    use {
  	'nvim-telescope/telescope.nvim', tag = '0.1.1',
	  -- or                          , branch = '0.1.x',
  	requires = { {'nvim-lua/plenary.nvim'} }
    }
    use 'windwp/nvim-autopairs'
    use 'tpope/vim-commentary'
    use 'nyoom-engineering/oxocarbon.nvim'
    use { "catppuccin/nvim", as = "catppuccin" }
    use "ellisonleao/gruvbox.nvim"
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
    }
    use {
       'nvim-lualine/lualine.nvim',
       requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use 'nvim-tree/nvim-web-devicons' -- OPTIONAL: for file icons
    use 'lewis6991/gitsigns.nvim' -- OPTIONAL: for git status
    use 'romgrk/barbar.nvim'
    use 'hrsh7th/vim-vsnip'
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
    -- Tree options
    use {
       "nvim-neo-tree/neo-tree.nvim",
       branch = "v2.x",
       requires = {
           "nvim-lua/plenary.nvim",
           "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
	         "MunifTanjim/nui.nvim",
       }
    }
end)

-- Tabs and spaces
vim.opt.expandtab = true       -- Use spaces instead of tabs
vim.opt.shiftwidth = 2         -- Set the number of spaces for each indentation level
vim.opt.tabstop = 2            -- Set the number of spaces to use for <Tab> key

-- Telescope usage
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<space>ff', builtin.find_files, {})
vim.keymap.set('n', '<space>fg', builtin.live_grep, {})
vim.keymap.set('n', '<space>fb', builtin.buffers, {})
vim.keymap.set('n', '<space>fh', builtin.help_tags, {})

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
	  -- ['<CR>'] = cmp.mapping.confirm({ select = true }),
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
require'barbar'.setup {
  icons = {
    button = "x"
  }
}
vim.api.nvim_set_keymap('n', '<S-Tab>', '<Cmd>BufferPrevious<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<Tab>', '<Cmd>BufferNext<CR>', { silent = true })
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
vim.api.nvim_set_keymap('n', '<A-C>', '<Cmd>BufferRestore<CR>', { silent = true })

-- Color theme
vim.opt.background = "dark" -- set this to dark or light
vim.cmd("colorscheme gruvbox")

-- Mappping saving and exiting
vim.api.nvim_set_keymap('n', '<C-q>', ':qa<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', { silent = true })

-- Line numbers and stuff
vim.opt.fillchars = { eob = " " }
vim.wo.scrolloff = 5
vim.opt.number = true
vim.opt.relativenumber = true

-- Commenting
vim.api.nvim_set_keymap('n', '<Space>/', ':Commentary<CR>', { silent = true })
vim.api.nvim_set_keymap('v', '<Space>/', ':Commentary<CR>', { silent = true })

-- Ctrl + movement keys
vim.api.nvim_set_keymap('i', '<C-j>', '<Down>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-k>', '<Up>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-l>', '<Right>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-h>', '<Left>', { silent = true })

-- Neotree
require('neo-tree').setup {
  filesystem = {
    filtered_items = {
      visible = true, -- This is what you want: If you set this to `true`, all "hide" just mean "dimmed out"
      hide_dotfiles = false,
    },
  }
}
vim.api.nvim_set_keymap('n', '<Space>e', ':Neotree<CR>', { silent = true })

-- Clang-format commat: space f m
vim.api.nvim_set_keymap('n', '<Space>fm', [[:%!clang-format<CR>]], { silent = true })
