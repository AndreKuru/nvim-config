---@type LazySpec
return {
  'mikavilpas/yazi.nvim',
  event = 'VeryLazy',
  keys = {
    { '<leader>oy', mode = { 'n', 'v' }, '<cmd>Yazi<cr>', desc = '[O]pen [Y]azi at the current file' },
    { '<leader>ow', mode = { 'n', 'v' }, '<cmd>Yazi cwd<cr>', desc = '[O]pen Yazi at the [w]orking directory' },
    {
      '<leader>ol',
      '<cmd>Yazi toggle<cr>',
      desc = '[O]pen the [l]ast Yazi session',
    },
  },
  ---@type YaziConfig
  opts = {
    open_for_directories = false,
    keymaps = {
      show_help = '',
    },
  },
  init = function()
    if pcall(require, 'which-key') and pcall(require, 'mini.icons') then
      local wk = require 'which-key'
      local mini = require 'mini.icons'
      wk.add {
        { '<leader>oy', icon = { icon = mini.get('filetype', 'dirpager'), color = 'purple' } },
        { '<leader>ow', icon = { icon = mini.get('filetype', 'dirpager'), color = 'purple' } },
        { '<leader>ol', icon = { icon = mini.get('filetype', 'dirpager'), color = 'purple' } },
      }
    end
  end,
}
