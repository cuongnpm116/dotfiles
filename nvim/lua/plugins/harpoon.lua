return {
  'theprimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = function()
    local keys = {
      {
        '<leader>ha',
        function()
          require('harpoon'):list():add()
        end,
      },
      {
        '<leader>hl',
        function()
          local harpoon = require('harpoon')
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
      },
    }

    for i = 1, 5 do
      table.insert(keys, {
        '<leader>h' .. i,
        function()
          require('harpoon'):list():select(i)
        end,
      })
    end
    return keys
  end,
}
