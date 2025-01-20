require 'core.options'
require 'core.keymaps'

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

vim.keymap.set('n', '<leader>lm', '<cmd>Lazy<CR>', { desc = 'Plugin [m]anager' })
vim.keymap.set('n', '<leader>li', '<cmd>Lazy install<CR>', { desc = '[I]nstall plugins' })
vim.keymap.set('n', '<leader>lu', '<cmd>Lazy update<CR>', { desc = '[U]pdate plugins' })
vim.keymap.set('n', '<leader>ls', '<cmd>Lazy sync<CR>', { desc = '[S]ync plugins' })
vim.keymap.set('n', '<leader>lc', '<cmd>Lazy clean<CR>', { desc = '[C]lean unused plugins' })

require('lazy').setup({
  require 'plugins.which-key',
  require 'plugins.themes.tokyonight',
  require 'plugins.telescope',
  require 'plugins.gitsigns',
  require 'plugins.lazygit',
  require 'plugins.yazi',
  require 'plugins.oil',
  require 'plugins.neo-tree',

  require 'plugins.lsp',
  require 'plugins.autoformat',
  require 'plugins.autocompletion',
  require 'plugins.debug',
  require 'plugins.sql',
  require 'plugins.vimtex',
  require 'plugins.treesitter',

  -- require 'plugins.none-ls',
  -- require 'plugins.auto-session',
  require 'plugins.spelunker',
  require 'plugins.tpope-misc',
  require 'plugins.highlights',
  require 'plugins.mini',
  require 'plugins.emoji',

  require 'kickstart.plugins.indent_line',
  require 'kickstart.plugins.lint',
  require 'kickstart.plugins.autopairs',
}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
