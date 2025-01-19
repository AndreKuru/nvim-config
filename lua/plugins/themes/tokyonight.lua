local bg_transparent = false
return {
  'folke/tokyonight.nvim',
  lazy = false,
  priority = 1000, -- Make sure to load this before all the other start plugins.
  opts = {
    transparent = bg_transparent,
  },
  init = function()
    local colorscheme = 'tokyonight-night'
    vim.cmd.colorscheme(colorscheme)

    local toggle_transparency = function()
      bg_transparent = not bg_transparent
      require('tokyonight').setup { transparent = bg_transparent }
      vim.cmd.colorscheme(colorscheme)
    end

    vim.keymap.set('n', '<leader>tt', toggle_transparency, { noremap = true, silent = true, desc = '[T]oggle background [t]ransparency' })

    if pcall(require, 'which-key') then
      local wk = require 'which-key'
      wk.add { '<leader>t', group = '[T]oggle', icon = { icon = '', color = 'purple' } }
    end

    vim.cmd.hi 'Comment gui=none'
  end,
}
