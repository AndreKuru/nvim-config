return {
  'allaman/emoji.nvim',
  ft = 'markdown',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'hrsh7th/nvim-cmp',
    'nvim-telescope/telescope.nvim',
  },
  opts = {
    enable_cmp_integration = true,
  },
  init = function()
    vim.keymap.set({ 'n', 'x', 'o' }, '<leader>le', '<cmd>Lazy load emoji.nvim<CR>', { desc = 'Load [e]mojis' })
  end,
  config = function(_, opts)
    vim.keymap.del({ 'n', 'x', 'o' }, '<leader>le')

    require('emoji').setup(opts)
    if pcall(require, 'telescope') then
      local ts = require('telescope').load_extension 'emoji'
      vim.keymap.set('n', '<leader>se', ts.emoji, { desc = '[S]earch [e]moji' })
    end
  end,
}
