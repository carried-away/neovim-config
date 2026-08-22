-- Module that provides the CodeCompanion statusline component
local M = {}

-- Function to be used in the statusline
M.code_companion_status = function()
  -- Access our state through a global variable
  if not _G.CodeCompanion then
    _G.CodeCompanion = {
      processing = false,
      spinner_index = 1,
      spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
      icon = "󰚩",
    }
    -- Set up autocmds to track CodeCompanion state
    local group = vim.api.nvim_create_augroup("CodeCompanionHooks", {})
    vim.api.nvim_create_autocmd({ "User" }, {
      pattern = "CodeCompanionRequest*",
      group = group,
      callback = function(args)
        if args.match == "CodeCompanionRequestStarted" then
          _G.CodeCompanion.processing = true
        elseif args.match == "CodeCompanionRequestFinished" then
          _G.CodeCompanion.processing = false
        end
        vim.cmd("redrawstatus")
      end,
    })
    -- Timer to update spinner animation
    local timer = vim.loop.new_timer()
    timer:start(100, 100, vim.schedule_wrap(function()
      if _G.CodeCompanion.processing then
        _G.CodeCompanion.spinner_index = (_G.CodeCompanion.spinner_index % #_G.CodeCompanion.spinner) + 1
        vim.cmd("redrawstatus")
      end
    end))
  end
  -- Return the spinner symbol or empty string
  if _G.CodeCompanion.processing then
  return "%#St_cc_icon#" .. _G.CodeCompanion.icon .. "%#St_cc_spinner# " .. _G.CodeCompanion.spinner[_G.CodeCompanion.spinner_index] .. "%#St_cc# "
    -- return _G.CodeCompanion.icon .. " " .. _G.CodeCompanion.spinner[_G.CodeCompanion.spinner_index] .. " "
  else
    return ""
  end
end

return M
