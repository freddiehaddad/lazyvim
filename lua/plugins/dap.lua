local update_theme = function()
  local hl = vim.api.nvim_set_hl
  hl(0, "DapUIScope", { fg = "#" .. vim.g.base16_gui0C })
  hl(0, "DapUIType", { fg = "#" .. vim.g.base16_gui0E })
  hl(0, "DapUIModifiedValue", { fg = "#" .. vim.g.base16_gui0C })
  hl(0, "DapUIDecoration", { fg = "#" .. vim.g.base16_gui0C })
  hl(0, "DapUIThread", { fg = "#" .. vim.g.base16_gui0B })
  hl(0, "DapUIStoppedThread", { fg = "#" .. vim.g.base16_gui0C })
  hl(0, "DapUISource", { fg = "#" .. vim.g.base16_gui0E })
  hl(0, "DapUILineNumber", { fg = "#" .. vim.g.base16_gui0C })
  hl(0, "DapUIFloatBorder", { fg = "#" .. vim.g.base16_gui0C })
  hl(0, "DapUIWatchesEmpty", { fg = "#" .. vim.g.base16_gui08 })
  hl(0, "DapUIWatchesValue", { fg = "#" .. vim.g.base16_gui0B })
  hl(0, "DapUIWatchesError", { fg = "#" .. vim.g.base16_gui08 })
  hl(0, "DapUIBreakpointsPath", { fg = "#" .. vim.g.base16_gui0C })
  hl(0, "DapUIBreakpointsInfo", { fg = "#" .. vim.g.base16_gui0B })
  hl(0, "DapUIBreakpointsCurrentLine", { fg = "#" .. vim.g.base16_gui0B })
  hl(0, "DapUIBreakpointsDisabledLine", { fg = "#" .. vim.g.base16_gui03 })
  hl(0, "DapUIStepOver", { fg = "#" .. vim.g.base16_gui0C })
  hl(0, "DapUIStepInto", { fg = "#" .. vim.g.base16_gui0C })
  hl(0, "DapUIStepBack", { fg = "#" .. vim.g.base16_gui0C })
  hl(0, "DapUIStepOut", { fg = "#" .. vim.g.base16_gui0C })
  hl(0, "DapUIStop", { fg = "#" .. vim.g.base16_gui08 })
  hl(0, "DapUIPlayPause", { fg = "#" .. vim.g.base16_gui0B })
  hl(0, "DapUIRestart", { fg = "#" .. vim.g.base16_gui0B })
  hl(0, "DapUIUnavailable", { fg = "#" .. vim.g.base16_gui03 })
  hl(0, "DapUIWinSelect", { fg = "#" .. vim.g.base16_gui0C })
end

return {
  {
    "rcarriga/nvim-dap-ui",
    dependencies = "freddiehaddad/base16-nvim",
    opts = function()
      -- dynamic theme updating
      update_theme()
      require("base16-nvim").listen(update_theme)
    end,
  },
}
