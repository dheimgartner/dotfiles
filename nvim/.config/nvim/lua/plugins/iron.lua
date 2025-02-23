return {
  "Vigemus/iron.nvim",
  enabled = false,
  config = function()
    local iron = require("iron.core")
    local view = require("iron.view")
    local common = require("iron.fts.common")

    iron.setup {
      config = {
        repl_definition = {
          r = {
            command = { "radian" },
            format = common.bracketed_paste
          },
        },
        repl_open_cmd = view.bottom(30),
      },
      keymaps = {
        send_line = "<C-CR>",
        visual_send = "<C-CR>",
        -- send_paragraph = "<C-CR>",
      },
    }
  end
}
