local plugins = {
  {
    "neovim/lsp-config",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  };
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "python-lsp-server",
        "clangd"
      },
    },
  }

}
return plugins