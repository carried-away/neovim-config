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
