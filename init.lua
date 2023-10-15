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
  "Yggdroot/indentLine",
  "gcmt/taboo.vim",
  "tpope/vim-commentary",
  {
    "nvim-telescope/telescope.nvim", tag = "0.1.3",
    dependencies = { 'nvim-lua/plenary.nvim' }
  }, 
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.configs")
      configs.setup({
        sync_install = false,
        ensure_installed = {
          "bash",
          "c",
          "cpp",
          "html",
          "javascript",
          "json",
          "lua",
          "markdown",
          "markdown_inline",
          "python",
          "query",
          "regex",
          "tsx",
          "typescript",
          "vim",
          "vimdoc",
          "yaml"
        },
        highlight = { enable = true },
        indent = { enable = true },  
      })
    end
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {}
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', opt = true }
  },
  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip",
  "rafamadriz/friendly-snippets",
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path'
    }
  },
  'neovim/nvim-lspconfig',
  "williamboman/mason.nvim",
  {
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  },
  -- Themes
  "ellisonleao/gruvbox.nvim",
  "joshdick/onedark.vim",
  { "tanvirtin/monokai.nvim", priority = 1000 },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 }
})

-- Lsp config
local cmp = require('cmp')
require("luasnip.loaders.from_vscode").lazy_load()
cmp.setup {
  mapping = {
	  ['<CR>'] = cmp.mapping.confirm({ select = true }),
	  ['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
	  ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
  },
  snippets = {
    expnad = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'luasnip' }
  },
}
local lspconfig = require('lspconfig')
lspconfig.clangd.setup{}
lspconfig.pyright.setup{}
lspconfig.cmake.setup{}

-- Mason setup
require("mason").setup()

-- Lua line configurations
require('lualine').setup{
  options = {
    icons_enabled = false,
    component_separators = { left = '|', right = '|'},
    section_separators = { left = '', right = ''},
  }
}

-- Commenting
vim.api.nvim_set_keymap('n', '<Space>/', ':Commentary<CR>', { silent = true })
vim.api.nvim_set_keymap('v', '<Space>/', ':Commentary<CR>', { silent = true })

-- Telescope usage
local builtin = require("telescope.builtin")
vim.keymap.set('n', '<space>ff', ":Telescope find_files hidden=true<CR>", {})
vim.keymap.set('n', '<space>fg', builtin.live_grep, {})
vim.keymap.set('n', '<space>fb', builtin.buffers, {})
vim.keymap.set('n', '<space>fh', builtin.help_tags, {})

-- Tabs and spaces
vim.opt.expandtab = true       -- Use spaces instead of tabs
vim.opt.shiftwidth = 2         -- Set the number of spaces for each indentation level
vim.opt.tabstop = 2            -- Set the number of spaces to use for <Tab> key

-- Mappping saving and exiting
vim.api.nvim_set_keymap('n', '<C-q>', ':qa<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', { silent = true })

-- Line numbers and stuff
vim.opt.fillchars = { eob = " " }
vim.wo.scrolloff = 5
vim.opt.number = true
vim.opt.relativenumber = true

-- Ctrl + movement keys
vim.api.nvim_set_keymap('i', '<C-j>', '<Down>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-k>', '<Up>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-l>', '<Right>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-h>', '<Left>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-h>', '<C-W>h', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-W>j', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-W>k', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-W>l', { noremap = true })

-- buffers, tabs and splits
vim.api.nvim_set_keymap('n', '<Space>s', ':split<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Space>v', ':vsplit<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Space>q', ':q<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Space>x', ':bdelete!<CR>', { noremap = true })
vim.api.nvim_set_keymap("n", "<C-t>", [[:tabnew<CR>]], { noremap =  true })
vim.api.nvim_set_keymap("n", "<A-w>", [[:tabclose<CR>]], { noremap =  true })
vim.api.nvim_set_keymap("n", "<A-l>", [[:tabnext<CR>]], { noremap =  true })
vim.api.nvim_set_keymap("n", "<A-h>", [[:tabprevious<CR>]], { noremap =  true })

-- terminal
vim.cmd[[
  augroup TerminalMode
    autocmd!
    autocmd TermOpen * setlocal nonumber norelativenumber
  augroup END
]]
function open_terminal()
  vim.cmd('tabnew')  -- Open a new tab
  vim.cmd('term')    -- Open a terminal in the new tab
end
vim.api.nvim_set_keymap('n', '<Space>t', [[:lua open_terminal()<CR>]], { noremap = true })
vim.api.nvim_set_keymap('t', '<A-i>', '<C-\\><C-n>', { noremap = true })

-- Clang-format command: space f m
vim.api.nvim_set_keymap('n', '<Space>fm', [[:%!clang-format<CR>]], { silent = true })
vim.api.nvim_set_keymap('n', '<Space>fl', [[:!cpplint %<CR>]], { silent = true })

-- Colorscheme
vim.cmd.colorscheme("gruvbox")

