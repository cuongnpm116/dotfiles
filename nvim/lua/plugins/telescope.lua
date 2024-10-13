return {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependency ={
        'nvim-lua/plenary.nvim',
    },
    config = function()
        require('telescope').setup({
            pickers = {
                find_files = {
                    file_ignore_patterns = { 'node_modules', '.git', '.env', 'bin', 'obj' },
                    hidden = true,
                },
            },
            live_grep = {
                file_ignore_patterns = { 'node_modules', '.git', '.env', 'bin', 'obj' },
                additional_args = function(_)
                    return { '--hidden' }
                end,
            },
        })

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>sf', builtin.find_files)
        vim.keymap.set('n', '<leader>sw', builtin.grep_string)
        vim.keymap.set('n', '<leader>sh', builtin.help_tags)
        vim.keymap.set('n', '<leader><leader>', builtin.buffers)
    end
}
