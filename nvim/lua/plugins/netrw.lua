return {
    'prichrd/netrw.nvim',
    dependencies = {
        'echasnovski/mini.icons',
        'nvim-tree/nvim-web-devicons',
    },
    config = function()
        require('netrw').setup {
            use_devicons = true,
        }
    end,
}
