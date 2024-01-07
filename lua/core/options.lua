local opt = vim.opt

-- show line number
opt.relativenumber = true
opt.number = true

-- indent
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.backspace = {
  'indent',
  'eol',
  'start'
}

-- there some problom with the wsl2`s clipboard
-- sys clipboard
-- opt.clipboard:append("unnamedplus")

--new windows`s position
opt.splitright = true
opt.splitbelow = true

-- search ignore case
opt.ignorecase = true
opt.smartcase = true

-- ture color
opt.termguicolors = true

-- others
-- Unprintable chars mapping
opt.listchars = {
  space = '_',
  tab = '• ',
  trail = '•',
  extends = '»',
  precedes = '«'
}

opt.wrap = false
opt.cursorline = true
opt.scrolloff = 10
opt.updatetime = 300
opt.signcolumn = "number"
