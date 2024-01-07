-- core config
require('core.options')
require('core.keymaps')
require('core.cmd')

-- plugins
require('plugins.plugins-setup')

-- use plugins
require('plugins.lualine') -- provide status line
require('plugins.nvim-tree') -- file explore
require('plugins.nvim-treesitter') -- hight light

-- lsp
require('plugins.lsp')
-- 没有效果，可能没有正确设置
-- require('plugins.nvim-dap-ui')
require('plugins.lsp-signature')
-- require('plugins.lsp-ui')

require('plugins.cmp')
require('plugins.comment')
require('plugins.nvim-autopairs')
require('plugins.bufferline')
require('plugins.gitsigns')
--
-- file finder
require('plugins.nvim-telescope')
-- require('plugins.nvim-fzy')

-- them
require('plugins.tokyonight')
