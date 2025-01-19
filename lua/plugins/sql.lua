return {
  'kristijanhusak/vim-dadbod-ui',
  dependencies = {
    { 'tpope/vim-dadbod', lazy = true },
    {
      'kristijanhusak/vim-dadbod-completion',
      ft = { 'sql', 'mysql', 'plsql' },
      lazy = true,
      config = function()
        if pcall(require, 'cmp') then
          local cmp = require 'cmp'
          cmp.setup {
            sources = cmp.config.sources(cmp.get_config().sources, {
              { name = 'vim-dadbod-completion' },
            }),
          }
        end
      end,
    },
  },
  cmd = {
    'DBUI',
    'DBUIToggle',
    'DBUIAddConnection',
    'DBUIFindBuffer',
  },
  keys = {
    { '<leader>Du', '<cmd>DBUI<CR>', desc = '[U]ser interface' },
    { '<leader>Da', '<cmd>DBUIAddConnection<CR>', desc = '[A]dd connection' },
    { '<leader>Dt', '<cmd>DBUIToggle<CR>', desc = '[T]oggle user interface' },
  },
  init = function()
    vim.g.db_ui_use_nerd_fonts = 1

    local home_path = os.getenv 'USERPROFILE' or os.getenv 'HOME'
    vim.g.db_ui_save_location = vim.g.db_ui_save_location or home_path .. '/.local/share/db_ui/'
    local edit_rhs = '<cmd>edit ' .. vim.g.db_ui_save_location .. 'connections.json<CR>'

    vim.keymap.set('n', '<leader>De', edit_rhs, { desc = '[D]atabase edit connection' })

    if pcall(require, 'which-key') and pcall(require, 'nvim-web-devicons') then
      local wk = require 'which-key'
      local devicons = require 'nvim-web-devicons'
      wk.add {
        { '<leader>D', group = '[D]atabase', icon = { icon = devicons.get_icon_by_filetype 'sql', color = 'purple' } },
        { '<leader>Du', icon = { icon = devicons.get_icon_by_filetype 'sql', color = 'purple' } },
        { '<leader>Da', icon = { icon = devicons.get_icon_by_filetype 'sql', color = 'purple' } },
        { '<leader>Dt', icon = { icon = devicons.get_icon_by_filetype 'sql', color = 'purple' } },
        { '<leader>De', icon = { icon = devicons.get_icon_by_filetype 'json', color = 'yellow' } },
      }
    end
  end,
  config = function()
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'dbout' },
      callback = function()
        vim.opt.foldenable = false
      end,
    })
  end,
}
