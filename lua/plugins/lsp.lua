require('mason').setup({
  ui = {
      icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗'
      }
  }
})

require('mason-lspconfig').setup({
  -- 确保安装，根据需要填写
  ensure_installed = {
    'lua_ls',
    'tsserver',
    'jsonls'
  },
})

require('mason-nvim-dap').setup({
  ensure_installed = {
  }
})

-- require('lspconfig').jdtls.setup{}
-- require('lspconfig').java_language_server.setup{}

require('lspconfig').lua_ls.setup{}
require('lspconfig').tsserver.setup{}
require('lspconfig').jsonls.setup{}
