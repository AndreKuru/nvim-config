---@type LazySpec
return {
  'mikavilpas/yazi.nvim',
  event = 'VeryLazy',
  keys = {
    -- 👇 in this section, choose your own keymappings!
    { '<leader>\\', mode = { 'n', 'v' }, '<cmd>Yazi<cr>', desc = 'Yazi at the Current File' },
    { '<leader>-', mode = { 'n', 'v' }, '<cmd>Yazi cwd<cr>', desc = 'Yazi at the Working Directory' },
    {
      '<c-up>',
      '<cmd>Yazi toggle<cr>',
      desc = 'Resume the last yazi session',
    },
  },
  ---@type YaziConfig
  opts = {
    -- if you want to open yazi instead of netrw, see below for more info
    open_for_directories = false,
    keymaps = {
      show_help = '',
    },
  },
}
