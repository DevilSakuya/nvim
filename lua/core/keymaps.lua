-- set leader
vim.g.mapleader = ' '

local keymap = vim.keymap

---- nvmap
-- ctrl+q find quote
keymap.set({'n', 'v'}, '<c-q>', '%')
-- ctrl+h,l move to line start ot end ignore witespace
keymap.set({'n', 'v'}, '<c-h>', '_')
keymap.set({'n', 'v'}, '<c-l>', '$')
-- ctrl+/ comment by comment.lua
keymap.set({'n', 'v'}, '', ':normal gcc<cr>')

---- imap
-- ctrl+s save
keymap.set('i', '<c-s>', '<c-c>:w<cr>')

---- nmap
-- ctrl+s save
keymap.set('n', '<c-s>', ':w<cr>')
-- ctrl+j,k move line
keymap.set('n', '<c-k>', ':m -2<cr>')
keymap.set('n', '<c-j>', ':m +1<cr>')

---- vmap
keymap.set('v', '<c-k>', ":m '<-2<cr>gv")
keymap.set('v', '<c-j>', ":m '>+1<cr>gv")

---- keymap
keymap.set('t', '<Esc>', '<c-\\><c-n><cr>')

---- leader map
keymap.set('n', '<leader><leader>', ':help<cr>')
-- keymap.set('n', '<leader>ff', ':FZF<cr>')
keymap.set('n', '<leader>b', ':ls<cr>:b ')
keymap.set('n', '<leader>t', ':bel term<cr>')
keymap.set('n', '<leader>e', ':NvimTreeOpen<cr>')

---- lsp map
-- Not all language servers provide the same capabilities. To ensure you only set
-- keymaps if the language server supports a feature, you can guard the keymap
-- calls behind capability checks:
local api = vim.api
local lsp = vim.lsp
local buf = lsp.buf
api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = lsp.get_client_by_id(args.data.client_id)
    if client.server_capabilities.hoverProvider then
      keymap.set('n', 'gh', buf.hover, { buffer = args.buf })
    end
  end,
})
api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    keymap.set('n', 'gh', buf.hover, { buffer = args.buf })
  end,
})
api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    keymap.set('n', 'ga', buf.code_action, { buffer = args.buf })
  end,
})
api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    keymap.set('n', 'gr', buf.references, { buffer = args.buf })
  end,
})
api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    keymap.set('n', 'gi', buf.implementation, { buffer = args.buf })
  end,
})
api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    keymap.set('n', 'gf', buf.format, { buffer = args.buf })
  end,
})

---- dap map test<--
keymap.set({'n', 'v'}, '<leader>dh', function()
  require('dap.ui.widgets').hover()
end)
keymap.set({'n', 'v'}, '<leader>dp', function()
  require('dap.ui.widgets').preview()
end)
keymap.set('n', '<leader>df', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.frames)
end)
keymap.set('n', '<leader>ds', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.scopes)
end)

-- 参考
-- keymap("n", "<F5>", "<CMD>lua require'dap'.continue()<CR>", opt)
-- keymap("n", "<F6>", "<CMD>lua require'dap'.step_over()<CR>", opt)
-- keymap("n", "<F7>", "<CMD>lua require'dap'.step_into()<CR>", opt)
-- keymap("n", "<F8>", "<CMD>lua require'dap'.step_out()<CR>", opt)
