return {
  {
    "aserowy/tmux.nvim",
    keys = {
      -- Move to window using the <ctrl> hjkl keys
      -- Must match tmux.conf settings
      { "<C-h>", "<C-w>h", desc = "Go to left window" },
      { "<C-j>", "<C-w>j", desc = "Go to lower window" },
      { "<C-k>", "<C-w>k", desc = "Go to upper window" },
      { "<C-l>", "<C-w>l", desc = "Go to right window" },
    },
    config = true,
  },
}
