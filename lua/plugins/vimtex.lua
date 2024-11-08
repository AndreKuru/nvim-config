return {
  'lervag/vimtex',
  lazy = false, -- we don't want to lazy load VimTeX
  -- tag = "v2.15", -- uncomment to pin to a specific release
  init = function()
    -- VimTeX configuration goes here, e.g.
    -- vim.g.vimtex_view_method = 'sumatrapdf'

    vim.g.vimtex_mappings_enabled = 0
    -- Custom keymaps for vimtex
    vim.keymap.set('n', '<leader>Lc', '<Plug>(vimtex-compile)', { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>Lv', '<Plug>(vimtex-view)', { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>Ls', '<Plug>(vimtex-stop)', { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>Lt', '<Plug>(vimtex-toc-toggle)', { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>Ln', '<Plug>(vimtex-env-next)', { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>Lp', '<Plug>(vimtex-env-prev)', { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>Le', '<Plug>(vimtex-errors)', { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>Ll', '<Plug>(vimtex-log)', { noremap = true, silent = true })
  end,
}
