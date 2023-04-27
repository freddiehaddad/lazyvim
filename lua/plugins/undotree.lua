return {
  {
    "mbbill/undotree",
    keys = {
      { "<leader>fu", "<cmd>UndotreeToggle<cr>", desc = "Undotree" },
    },
    init = function()
      vim.g.undotree_SetFocusWhenToggle = 1
    end,
  },
}
