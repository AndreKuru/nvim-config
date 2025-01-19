return {
  {
    'echasnovski/mini.icons',
    config = function()
      require('mini.icons').setup()
    end,
  },
  {
    'folke/which-key.nvim',
    dependencies = {
      'echasnovski/mini.icons',
      'nvim-tree/nvim-web-devicons',
    },
    event = 'VimEnter',
    opts = {
      icons = {
        mappings = vim.g.have_nerd_font,
        keys = vim.g.have_nerd_font and {} or {
          Up = '<Up> ',
          Down = '<Down> ',
          Left = '<Left> ',
          Right = '<Right> ',
          C = '<C-…> ',
          M = '<M-…> ',
          D = '<D-…> ',
          S = '<S-…> ',
          CR = '<CR> ',
          Esc = '<Esc> ',
          ScrollWheelDown = '<ScrollWheelDown> ',
          ScrollWheelUp = '<ScrollWheelUp> ',
          NL = '<NL> ',
          BS = '<BS> ',
          Space = '<Space> ',
          Tab = '<Tab> ',
          F1 = '<F1>',
          F2 = '<F2>',
          F3 = '<F3>',
          F4 = '<F4>',
          F5 = '<F5>',
          F6 = '<F6>',
          F7 = '<F7>',
          F8 = '<F8>',
          F9 = '<F9>',
          F10 = '<F10>',
          F11 = '<F11>',
          F12 = '<F12>',
        },
      },
    },
    config = function()
      local wk = require 'which-key'
      local mini = require 'mini.icons'
      local devicons = require 'nvim-web-devicons'

      wk.add {
        { '<leader>l', group = '[L]azy', icon = { icon = mini.get('filetype', 'lazy'), color = 'blue' } },
        { '<leader>d', group = '[D]ebug', icon = { icon = mini.get('filetype', 'dapui_console'), color = 'red' } },
        { '<leader>s', group = '[S]earch', icon = { icon = '', color = 'green' } },
        { '<leader>tt', icon = { icon = '', color = 'purple' } },
        { '<leader>h', group = 'Git [h]unk', mode = { 'n', 'v' }, icon = { icon = mini.get('filetype', 'git'), color = 'orange' } },
        { '<leader>L', group = '[L]aTeX', icon = { icon = devicons.get_icon_color_by_filetype 'tex', color = 'green' } },

        { '<leader>o', group = '[O]pen through terminal', icon = { icon = devicons.get_icon_by_filetype 'terminal', color = 'purple' } },
        { '<leader>ou', icon = { icon = mini.get('filetype', 'urlshortcut'), color = 'azure' } },
        { '<leader>og', icon = { icon = mini.get('filetype', 'git'), color = 'orange' } },
      }

      vim.api.nvim_create_autocmd('BufEnter', {
        callback = function()
          local filetype = vim.bo.filetype
          wk.add {
            {
              '<leader>c',
              group = 'LSP: [C]ode',
              mode = { 'n', 'x' },
              icon = {
                icon = devicons.get_icon_by_filetype(filetype),
                color = 'grey',
              },
            },
            { '<leader>cs', group = 'LSP: [C]ode [S]ymbols', mode = { 'n', 'x' } },
          }
        end,
      })
    end,
  },
}
