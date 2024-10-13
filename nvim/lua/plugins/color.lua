function ColorMyPencils(color)
    color = color or 'tokyonight'
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
end

-- Sets colors to line numbers Above, Current and Below  in this order
function LineNumberColors()
    vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = '#b2b8cf', bold = true })
    vim.api.nvim_set_hl(0, 'LineNr', { fg = '#b2b8cf', bold = true })
    vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = '#b2b8cf', bold = true })
end

return {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
        require('tokyonight').setup({
            style = 'night',
        })

        ColorMyPencils()
        LineNumberColors()
    end
}
