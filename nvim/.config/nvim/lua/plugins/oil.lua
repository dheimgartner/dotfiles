return {
  "stevearc/oil.nvim",
  dependencies = {
    {
      "echasnovski/mini.icons", opts = {}
    },
  },
  opts = {
    win_options = {
      number = false,
      relativenumber = false,
    },
    view_options = { show_hidden = true },
  }, -- This works automatically in lazy.nvim
  lazy = false, -- Ensure it's always loaded
}

