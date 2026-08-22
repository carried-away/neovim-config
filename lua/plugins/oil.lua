return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  keys = {
    { "<leader>o", function() require("oil").open() end, mode = "n", noremap = true, silent = true, desc = "Open Oil file explorer" },
  },
  opts = {
    keymaps = {
      ['<C-u>'] = 'actions.preview_scroll_up',
      ['<C-d>'] = 'actions.preview_scroll_down',
      ['<C-v>'] = { 'actions.select', opts = { vertical = true } },
      ['<C-s>'] = function()
        require('oil').save()
      end,
    },
    view_options = {
      show_hidden = true,
    },
  },
  -- Optional dependencies
  -- dependencies = { { 'echasnovski/mini.icons', opts = {} } },
  dependencies = { { 'nvim-tree/nvim-web-devicons', opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
}

