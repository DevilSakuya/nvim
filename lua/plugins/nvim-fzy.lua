require('fzy').setup({})

-- nnoremap <silent><leader>ff :lua fzy.execute('fd', fzy.sinks.edit_file)<CR>
-- nnoremap <silent><leader>fg :lua fzy.execute('git ls-files', fzy.sinks.edit_file)<CR>
-- nnoremap <silent><leader>fl :lua fzy.execute('ag --nobreak --noheading .', fzy.sinks.edit_live_grep)<CR>

-- vim.keymap.set('n', '<leader>ff', fzy.execute('fd', fzy.sinks.edit_file), {})
