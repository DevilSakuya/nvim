local config = {
  padding = true,
  sticky = true,
  ignore = nil,
  toggler = { line = 'gcc', block = 'gc' },
  opleader = { line = nil, block = nil},
  extra = nil, -- { above = 'gcO', below = 'gco', eol = 'gcA' },
  mappings = { basic = true, extra = true },
  pre_hook = nil,
  post_hook = nil,
}
require('Comment').setup(config)
