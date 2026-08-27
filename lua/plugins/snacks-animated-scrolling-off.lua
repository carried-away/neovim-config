return {
  "folke/snacks.nvim",
  opts = {
    scroll = {
      enabled = false, -- Disable scrolling animations
    },
  },
  keys = {
    -- { "<leader>lg", function() Snacks.lazygit() end, desc = "Lazygit" },
    -- { "<leader>gc", function() Snacks.lazygit.log_file() end, desc = "Lazygit Current File" },
    -- { "<leader>gl", function() Snacks.lazygit.log() end, desc = "Lazygit Log" },
    { "<leader>fd", function() Snacks.picker.files({cwd = vim.fn.stdpath('data')}) end, desc = "Find Nvim Data" },
  },
}
