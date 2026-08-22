-- Options are automatically loaded before lazy.nvim startup.
require("config.remote_clipboard").setup()

local cmd = vim.cmd
local g = vim.g
local o = vim.o
local opt = vim.opt
local autocmd = vim.api.nvim_create_autocmd

opt.relativenumber = false
vim.g.autoformat = false

-- spellchecker
autocmd('FileType', {
  pattern = { 'html', 'markdown' },
  callback = function()
    vim.opt.spell = true
    vim.opt.spelllang = { 'en_us' }
  end,
})

-- turn off spellchecker in terminal
autocmd('TermOpen', {
  pattern = '*',
  command = 'setlocal nospell',
})

-- When in a comment and enter, o or O are pressed, do not auto-comment
autocmd('FileType', {
  command = 'set formatoptions-=cro',
})

opt.incsearch = true
opt.hlsearch = true
opt.relativenumber = true
opt.linebreak = true




