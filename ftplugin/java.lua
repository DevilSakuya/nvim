local jdtls = require('jdtls')

-- jdtls config
local root_dir_marks = { '.git', 'mvnw' }
local home = os.getenv('HOME')
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local jdt_workspace = home .. '/.workspace/' .. project_name
local jdt_java_home = home .. "/dev/jdk/jdk-17"
local jdt_home = home .. "/code/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository"
local jdt_version = '*'

local java_debug_plugin = home .. '/code/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar'
local bundles = {
  vim.fn.glob(java_debug_plugin, 1)
}

local extendedClientCapabilities = jdtls.extendedClientCapabilities;
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true;

-- use 4 space for java indent
local on_attach = function()
  vim.opt.tabstop = 4
  vim.opt.shiftwidth = 4
end

local config = {
  cmd = {
    jdt_java_home .. '/bin/java',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xmx1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
    '-jar', vim.fn.glob(jdt_home .. '/plugins/org.eclipse.equinox.launcher_' .. jdt_version .. '.jar', 1),
    '-configuration', jdt_home .. '/config_linux',
    '-data', jdt_workspace
  },

  root_dir = vim.fs.dirname(vim.fs.find(root_dir_marks, { upward = true})[1]),

  settings = {
    java = {
      signatureHelp = {
        enabled = true
      }
    }
  },

  init_options = {
    bundles = bundles,
    extendedClientCapabilities = extendedClientCapabilities
  },

  on_attach = on_attach
}

jdtls.start_or_attach(config)
