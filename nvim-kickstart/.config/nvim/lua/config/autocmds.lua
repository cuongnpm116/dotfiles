local autocmd = vim.api.nvim_create_autocmd

local function augroup(name)
  return vim.api.nvim_create_augroup('cuong_' .. name, { clear = true })
end

-- remove space at the end of all lines
autocmd({ 'BufWritePre' }, {
  group = augroup('remove_space'),
  pattern = '*',
  command = [[%s/\s\+$//e]],
})

-- highlight on yank
autocmd('TextYankPost', {
  group = augroup('highlight_yank'),
  pattern = '*',
  callback = function()
    vim.hl.on_yank({
      higroup = 'IncSearch',
      timeout = 100,
    })
  end,
})
