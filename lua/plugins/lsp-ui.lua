require("LspUI").setup({})

keymap.set('n', 'gh', ':LspUI hover<cr>')
keymap.set('n', 'gi', ':LspUI implementation<cr>')
keymap.set('n', 'ga', ':LspUI code_action<cr>')
keymap.set('n', 'gd', ':LspUI definition<cr>')
keymap.set('n', 'gr', ':LspUI references<cr>')
