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

-- Ensure runInTerminal for C/C++ codelldb launch configs so stdout appears in dap-ui
-- Place this in lua/plugins/ and restart Neovim to take effect.
local ok, dap = pcall(require, "dap")
if not ok then
  return
end

for _, lang in ipairs({"c", "cpp"}) do
  local cfgs = dap.configurations[lang] or {}
  for _, cfg in ipairs(cfgs) do
    if cfg.type == "codelldb" and cfg.request == "launch" then
      cfg.runInTerminal = true
      -- ensure console is set so some adapters respect terminal behavior
      if cfg.console == nil then
        cfg.console = "integratedTerminal"
      end
    end
  end
end
