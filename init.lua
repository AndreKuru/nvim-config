require 'core.options'
require 'core.keymaps'

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

vim.keymap.set('n', '<leader>lp', '<cmd>Lazy<CR>', { desc = '[L]azy [P]lugin Manager' })
vim.keymap.set('n', '<leader>li', '<cmd>Lazy install<CR>', { desc = '[I]nstall Plugins' })
vim.keymap.set('n', '<leader>lu', '<cmd>Lazy update<CR>', { desc = '[U]pdate Plugins' })
vim.keymap.set('n', '<leader>ls', '<cmd>Lazy sync<CR>', { desc = '[S]ync Plugins' })
vim.keymap.set('n', '<leader>lc', '<cmd>Lazy clean<CR>', { desc = '[C]lean Unused Plugins' })

require('lazy').setup({
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  require 'plugins.gitsigns',
  require 'plugins.which-key',
  require 'plugins.telescope',
  require 'plugins.lsp',
  require 'plugins.roslyn',
  require 'plugins.autoformat',
  require 'plugins.autocompletion',
  require 'plugins.themes.tokyonight',
  require 'plugins.emoji',
  require 'plugins.sql',
  require 'plugins.lazygit',
  require 'plugins.yazi',
  require 'plugins.oil',

  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  require 'plugins.mini',
  require 'plugins.treesitter',
  require 'plugins.neo-tree',
  require 'plugins.vimtex',

  require 'kickstart.plugins.debug',
  require 'kickstart.plugins.indent_line',
  require 'kickstart.plugins.lint',
  require 'kickstart.plugins.autopairs',
  require 'kickstart.plugins.gitsigns', -- adds gitsigns recommend keymaps
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
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
