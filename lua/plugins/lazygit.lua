return {
  'kdheepak/lazygit.nvim',
  lazy = true,
  cmd = {
    'LazyGit',
    'LazyGitConfig',
    'LazyGitCurrentFile',
    'LazyGitFilter',
    'LazyGitFilterCurrentFile',
  },
  dependencies = {
    'nvim-lua/plenary.nvim', -- optional for floating window border decoration
  },
  keys = {
    { '<leader>lg', '<cmd>LazyGit<cr>', desc = '[L]azy[G]it' },
  },
  init = function()
    if pcall(require, 'which-key') and pcall(require, 'mini.icons') then
      local wk = require 'which-key'
      local mini = require 'mini.icons'
      wk.add { '<leader>lg', icon = { icon = mini.get('filetype', 'git'), color = 'orange' } }
    end
  end,
}
