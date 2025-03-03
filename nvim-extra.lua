-- Exiting the terminal.
vim.cmd.tnoremap("<C-\\> <C-\\><C-N>")

-- vim.cmd.colorscheme("retrobox")
vim.cmd('source ~/.config/nvim/walh-default.vim')

require("lspconfig")["gdscript"].setup({
  name = "godot",
  cmd = vim.lsp.rpc.connect("127.0.0.1", 6005),
})

local dap = require("dap")
dap.adapters.godot = {
    type = "server",
    host = "127.0.0.1",
    port = 6006,
}

dap.configurations.gdscript = {
    {
        type = "godot",
        request = "launch",
        name = "Launch scene",
        project = "${workspaceFolder}",
        launch_scene = true,
    },
}

require('Comment').setup {
    pre_hook = function(ctx)
        -- Determine if we're using line or block comments
        local U = require('Comment.utils')

        -- Define custom comment styles for specific filetypes
        local comment_styles = {
            asm = '; %s',
            c = '/* %s */',
            -- vim = '" %s',        -- Vim script uses double quotes
            -- python = '# %s',     -- Python uses #
            -- sql = '-- %s',       -- SQL uses --
            -- html = '<!-- %s -->', -- HTML uses <!-- -->
        }

        -- Get the current file type
        local filetype = vim.bo.filetype

        -- Return the appropriate commentstring if defined
        if comment_styles[filetype] then
            return comment_styles[filetype]
        end
    end
}

require'nvim-treesitter.configs'.setup {
    ensure_installed = { "c", "cpp", "lua", "python", "asm", "c_sharp",
                "markdown", "dart", "java", "javascript",
                "html", "css", "typst", "bash", "gitignore",
                "rust", "diff", "json", "yaml", "toml", "vim",
                "vimdoc", "typescript" },
}

vim.cmd("let g:c_syntax_for_h = 1")

vim.cmd("set mouse=")
vim.cmd("set scrolloff=5")
