-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local g = vim.g
g.mapleader = " "
g.maplocalleader = "\\"
g.snacks_animate = true

-- LazyVim root dir detection
-- Each entry can be:
-- * the name of a detector function like `lsp` or `cwd`
-- * a pattern or array of patterns like `.git` or `lua`.
-- * a function with signature `function(buf) -> string|string[]`
g.root_spec = { "lsp", { ".git", "lua" }, "cwd" }

-- Hide deprecation warnings.
g.deprecation_warnings = false

-- Show the current document symbols location from Trouble in lualine
-- You can disable this for a buffer by setting `vim.b.trouble_lualine = false`
g.trouble_lualine = true

local opt = vim.opt
opt.mouse = "a" -- Enable mouse mode
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.expandtab = true -- Use spaces instead of tabs
opt.tabstop = 2
opt.softtabstop = 0
opt.shiftwidth = 2

-- only set clipboard if not in ssh, to make sure the OSC 52
-- integration works automatically.
opt.clipboard = vim.env.SSH_CONNECTION and "" or "unnamedplus" -- Sync with system clipboard

opt.ignorecase = true -- Ignore case
opt.linebreak = true -- Wrap lines at convenient points
opt.termguicolors = true -- True color support
opt.timeoutlen = vim.g.vscode and 1000 or 300 -- Lower than default (1000) to quickly trigger which-key
opt.undofile = true
opt.undolevels = 10000
opt.showmode = false -- Dont show mode since we have a statusline
opt.autowrite = true -- Auto-save when leaving a buffer
opt.confirm = true -- Prompt to save before exiting modified buffer
opt.smartcase = true -- Ignore case unless search has uppercase
opt.signcolumn = "yes" -- prevent text shifting when signs appear
opt.list = true -- show invisible characters (tabs, trailing spaces)
opt.scrolloff = 4 -- Lines of context
opt.splitbelow = true -- Put new windows below current
opt.splitright = true -- Put new windows right of current
