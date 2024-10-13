return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
        require('nvim-treesitter.configs').setup({
            ensure_installed = {
                'bash',
                'c',
                'cpp',
                'c_sharp',
                'html',
                'css',
                'scss',
                'json',
                'javascript',
                'jsdoc',
                'typescript',
                'tsx',
                'lua',
                'vim',
                'vimdoc'
            },
            sync_install = false,
            auto_install = true,
            indent = {
                enable = true
            },
            highlight = {
                enable = true
            }
        })
    end
}
