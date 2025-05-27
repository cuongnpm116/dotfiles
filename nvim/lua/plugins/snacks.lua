return {
  'folke/snacks.nvim',
  opts = {
    picker = {
      exclude = {
        '.git',
        'node_modules',
        'bin',
        'obj',
      },
      sources = {
        explorer = {
          layout = {
            layout = {
              position = 'right',
            },
          },
        },
      },
    },
  },
}
