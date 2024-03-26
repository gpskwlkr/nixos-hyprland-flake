local opt = vim.opt

opt.nu = true
opt.relativenumber = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.smartindent = true
opt.wrap = false

opt.hlsearch = false
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

opt.termguicolors = true

opt.scrolloff = 8
opt.signcolumn = "yes"

opt.updatetime = 50

-- opt.colorcolumn = "80"

opt.cursorline = true

opt.clipboard:append("unnamedplus")
opt.backspace = "indent,eol,start"
opt.splitright = true
opt.splitbelow = true
opt.iskeyword:append("-")
