-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Enable spell check by default unless in vscode
if not vim.g.vscode then
  vim.o.spell = true
end

-- Set conceal level to 0
vim.o.conceallevel = 0

-- off showmode
vim.opt.showmode = false

-- for screen breaking if the code or the line is too long
vim.opt.breakindent = true

-- vim.opt.expandtab = true --Convert tabs to spaces
-- vim.opt.shiftwidth = 4   -- Amount to indent

vim.opt.tabstop = 4
vim.opt.softtabstop = 4

-- True to show line numbers false to not show line number
-- vim.opt.number = false
-- vim.opt.relativenumber = false

-- Show line under cursor
vim.opt.cursorline = true

-- Mouse mode
vim.opt.mouse = "a"

-- Case-insensitive for searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = "yes"

-- Number of screen lines to keep above and below the cursor
-- vim.opt.scrolloff = 10

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.termguicolors = true
