local spinner = require "config.codecompanion.dot-spinner"

return {
  "olimorris/codecompanion.nvim",
  opts = {
    interactions = {
      chat = {
        adapter = "copilot_acp",
        -- model = "",
        roles = {
          user = "Ray",
        },
        keymaps = {
          close = {
            modes = {
              n = "<S-D>",
              i = "null",
            },
          },
          send = {
            callback = function(chat)
              vim.cmd "stopinsert"
              chat:submit()
            end,
          },
        },
      },
      inline = {
        adapter = "gemini",
      },
      cmd = {
        adapter = "gemini",
      },
      background = {
        adapter = {
          name = "gemini",
          -- model = "",
        },
      },
    },
    display = {
      diff = {
        provider_opts = {
          inline = {
            layout = "buffer",
          },
        },
      },
      chat = {
        intro_message = " Chat with CodeCompanion 💬 Press ? for options",
      },
    },
  },
  lazy = true,
  keys = {
    { "<leader>co", "<cmd>CodeCompanionChat Toggle<cr>", desc = "Code Companion: Toggle" },
    { "<leader>cp", "<cmd>CodeCompanionActions<cr>", desc = "Code Companion: Actions" },
  },
  cmd = {
    "CodeCompanion",
    "CodeCompanionChat",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "j-hui/fidget.nvim",
  },
  init = function()
    require("config.codecompanion.fidget-spinner"):init()
  end,
}
