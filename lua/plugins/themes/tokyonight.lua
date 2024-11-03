return { -- You can easily change to a different colorscheme.
  -- Change the name of the colorscheme plugin below, and then
  -- change the command in the config to whatever the name of that colorscheme is.
  --
  -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
  'folke/tokyonight.nvim',
  lazy = false,
  priority = 1000, -- Make sure to load this before all the other start plugins.
  opts = {
    transparent = false,
  },
  init = function()
    -- Load the colorscheme here.
    -- Like many other themes, this one has different styles, and you could load
    -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
    vim.cmd.colorscheme 'tokyonight-night'

    -- Toggle background transparency
    local bg_transparent = false

    local toggle_transparency = function()
      bg_transparent = not bg_transparent
      require('tokyonight').setup { transparent = bg_transparent }
      vim.cmd.colorscheme 'tokyonight-night'
    end

    vim.keymap.set('n', '<leader>tt', toggle_transparency, { noremap = true, silent = true, desc = 'Toggle background transparency' })

    -- You can configure highlights by doing something like:
    vim.cmd.hi 'Comment gui=none'
  end,
}
