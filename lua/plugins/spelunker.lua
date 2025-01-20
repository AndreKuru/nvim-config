return {
  'kamykn/spelunker.vim',
  dependencies = {
    'kamykn/popup-menu.nvim',
  },
  init = function()
    vim.g.enable_spelunker_vim = 0

    vim.g.enable_spelunker_vim_on_readonly = 0
    vim.g.spelunker_target_min_char_len = 4
    vim.g.spelunker_max_suggest_words = 15
    vim.g.spelunker_max_hi_words_each_buf = 100

    -- Spellcheck type: (default: 1)
    -- 1: File is checked for spelling mistakes when opening and saving. This
    -- may take a bit of time on large files.
    -- 2: Spellcheck displayed words in buffer. Fast and dynamic. The waiting time
    -- depends on the setting of CursorHold `set updatetime=1000`.
    vim.g.spelunker_check_type = 2

    -- Highlight type: (default: 1)
    -- 1: Highlight all types (SpellBad, SpellCap, SpellRare, SpellLocal).
    -- 2: Highlight only SpellBad.
    -- FYI: https://vim-jp.org/vimdoc-en/spell.html#spell-quickstart
    vim.g.spelunker_highlight_type = 1

    vim.g.spelunker_disable_uri_checking = 0
    vim.g.spelunker_disable_email_checking = 0
    vim.g.spelunker_disable_account_name_checking = 0 -- Disable account name checking and JAVA annotations, e.g. @foobar, foobar@.
    vim.g.spelunker_disable_acronym_checking = 0
    vim.g.spelunker_disable_backquoted_checking = 0
    vim.g.spelunker_disable_auto_group = 0

    -- vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost' }, {
    --   group = vim.api.nvim_create_augroup('spelunker', { clear = true }),
    --   pattern = { '*.vim', '*.js', '*.jsx', '*.json', '*.md', '*.txt', '*.csv' },
    --   callback = function()
    --     vim.g.enable_spelunker_vim = 1
    --     vim.fn['spelunker#check']()
    --   end,
    -- })
    -- TODO: it's not triggering by the extensions yet

    vim.g.spelunker_spell_bad_group = 'SpelunkerSpellBad'
    vim.g.spelunker_complex_or_compound_word_group = 'SpelunkerComplexOrCompoundWord'

    vim.api.nvim_set_hl(0, 'SpelunkerSpellBad', { underline = true, ctermfg = 247, fg = '#9e9e9e' })
    vim.api.nvim_set_hl(0, 'SpelunkerComplexOrCompoundWord', { underline = true, ctermfg = 'NONE', fg = 'NONE' })

    local toggle_spelunker = function()
      vim.g.enable_spelunker_vim = vim.g.enable_spelunker_vim == 0 and 1 or 0
      vim.fn['spelunker#check']()
    end
    vim.keymap.set('n', '<leader>ts', toggle_spelunker, { desc = '[T]oggle [S]pelunker' })
  end,
}
