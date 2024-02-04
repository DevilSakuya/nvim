local jdtls = require('jdtls')

-- jdtls config
-- TODO thoese config shuled use env to config
local root_dir_marks = { '.git', 'mvnw' }
local home = os.getenv('HOME')
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

-- TOOD java home and runtimes config should use env or some more generic configs
local jdt_workspace = home .. '/.workspace/' .. project_name
local jdt_java_home = home .. '/dev/jdk/jdk-17'

-- use mason to manager java lsp plugins
local mason_install_dir = vim.fn.stdpath("data") .. '/mason'
local jdt_home = mason_install_dir .. '/packages/jdtls'
local jdt_version = '*'

local java_debug_plugin = mason_install_dir .. '/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar'

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
      },
      configuration = {
        runtimes = {
          {
            name = 'JavaSE-21',
            path = home .. '/dev/jdk/jdk-21'
          },
          {
            name = 'JavaSE-20',
            path = home .. '/dev/jdk/jdk-20'
          },
          {
            name = 'JavaSE-17',
            path = home .. '/dev/jdk/jdk-17'
          }
        }
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
