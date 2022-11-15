vim.cmd([[packadd packer.nvim]])
require("packer").startup(function()
  use("wbthomason/packer.nvim")
  use("morhetz/gruvbox")
  use("nvim-treesitter/nvim-treesitter")
  use("nvim-lualine/lualine.nvim")
  use("junegunn/fzf")
  use("junegunn/fzf.vim")
  use("numToStr/Comment.nvim")
  use("windwp/nvim-autopairs")
  use{'neoclide/coc.nvim', branch = 'release'}
  vim.cmd([[colorscheme gruvbox]])
  require("nvim-autopairs").setup()
  require("Comment").setup()
  require("lualine").setup({
    options = {
      icons_enabled = false,
      theme = 'gruvbox'
    },
  })
  require("nvim-treesitter.configs").setup({
    ensure_installed = { "c", "lua", "rust", "python" },
    highlight = {
      enable = true,
    },
  })
end)

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.list = true
vim.opt.listchars:append("tab:> ")
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.swapfile = false
vim.opt.wrap = false

vim.g.mapleader = " "
vim.api.nvim_set_keymap("n", "<leader>fh", ":History<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>ff", ":Files %:p:h<CR>", { noremap = true })
