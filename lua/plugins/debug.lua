return {
  {
    'mfussenegger/nvim-dap',
    init = function()
      local dap = require 'dap'
      vim.keymap.set('n', '<leader>dc', dap.continue, { desc = '[C]ontinue' })
      vim.keymap.set('n', '<leader>di', dap.step_into, { desc = 'Step [i]nto' })
      vim.keymap.set('n', '<leader>do', dap.step_over, { desc = 'Step [o]ver' })
      vim.keymap.set('n', '<leader>dO', dap.step_out, { desc = 'Step [o]ut' })
      vim.keymap.set('n', '<leader>db', dap.step_back, { desc = 'Step [b]ack' })
      vim.keymap.set('n', '<leader>dr', dap.restart, { desc = '[R]estart' })
      vim.keymap.set('n', '<leader>ds', dap.terminate, { desc = '[S]top' })
      vim.keymap.set('n', '<leader>dd', dap.disconnect, { desc = '[D]isconnect' })
      vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = 'Toggle [b]reakpoint' })

      vim.keymap.set('n', '<leader>dB', function()
        dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
      end, { desc = 'Set conditional [b]reakpoint' })

      if pcall(require, 'which-key') and pcall(require, 'mini.icons') and vim.g.have_nerd_font then
        local wk = require 'which-key'
        local mini = require 'mini.icons'
        wk.add {
          { '<leader>d', group = '[D]ebug', icon = { icon = mini.get('filetype', 'dapui_console'), color = 'red' } },
          { '<leader>dc', icon = { icon = '', color = 'green' } },
          { '<leader>di', icon = { icon = '', color = 'azure' } },
          { '<leader>do', icon = { icon = '', color = 'azure' } },
          { '<leader>dO', icon = { icon = '', color = 'azure' } },
          { '<leader>db', icon = { icon = '', color = 'azure' } },
          { '<leader>dr', icon = { icon = '', color = 'green' } },
          { '<leader>ds', icon = { icon = '', color = 'red' } },
          { '<leader>dd', icon = { icon = '', color = 'red' } },
          { '<leader>db', icon = { icon = '', color = 'red' } },
          { '<leader>dB', icon = { icon = '', color = 'red' } },
        }
      end
    end,
  },
  {
    'rcarriga/nvim-dap-ui',
    dependencies = {
      'mfussenegger/nvim-dap',
      'nvim-neotest/nvim-nio',
    },
    init = function()
      local dapui = require 'dapui'
      vim.keymap.set('n', '<leader>dl', dapui.toggle, { desc = '[L]ast session result' })

      if pcall(require, 'which-key') and vim.g.have_nerd_font then
        local wk = require 'which-key'
        wk.add {
          { '<leader>dl', icon = { icon = '', color = 'azure' } },
        }
      end
    end,
    config = function()
      local dap = require 'dap'
      local dapui = require 'dapui'

      -- For more information, see |:help nvim-dap-ui|
      dapui.setup {
        icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
        controls = {
          icons = vim.g.have_nerd_font and {} or {
            play = '▶',
            step_into = '⏎',
            step_over = '⏭',
            step_out = '⏮',
            step_back = 'b',
            run_last = '▶▶',
            pause = '⏸',
            terminate = '⏹',
            disconnect = '⏏',
          },
        },
      }

      -- Change breakpoint icons
      vim.api.nvim_set_hl(0, 'DapBreak', { fg = '#e51400' })
      vim.api.nvim_set_hl(0, 'DapStop', { fg = '#ffcc00' })
      local breakpoint_icons = vim.g.have_nerd_font
          and { Breakpoint = '', BreakpointCondition = '', BreakpointRejected = '', LogPoint = '', Stopped = '' }
        or { Breakpoint = '●', BreakpointCondition = '⊜', BreakpointRejected = '⊘', LogPoint = '◆', Stopped = '⭔' }
      for type, icon in pairs(breakpoint_icons) do
        local tp = 'Dap' .. type
        local hl = (type == 'Stopped') and 'DapStop' or 'DapBreak'
        vim.fn.sign_define(tp, { text = icon, texthl = hl, numhl = hl })
      end

      dap.listeners.after.event_initialized['dapui_config'] = dapui.open
      dap.listeners.before.event_terminated['dapui_config'] = dapui.close
      dap.listeners.before.event_exited['dapui_config'] = dapui.close
    end,
  },
  {
    'jay-babu/mason-nvim-dap.nvim',
    dependencies = {
      'mfussenegger/nvim-dap',
      'williamboman/mason.nvim',
    },
    config = function()
      require('mason-nvim-dap').setup {
        automatic_installation = true,
        handlers = {},
        ensure_installed = {
          -- 'delve',
          'python',
        },
      }
    end,
  },
  {
    -- 'leoluz/nvim-dap-go',
    -- Install golang specific config
    -- require('dap-go').setup {
    --   delve = {
    --     -- On Windows delve must be run attached or it crashes.
    --     -- See https://github.com/leoluz/nvim-dap-go/blob/main/README.md#configuring
    --     detached = vim.fn.has 'win32' == 0,
    --   },
    -- },
  },
  {
    'mfussenegger/nvim-dap-python',
    dependencies = {
      'mfussenegger/nvim-dap',
    },
    config = function()
      require('dap-python').setup()
    end,
  },
}
