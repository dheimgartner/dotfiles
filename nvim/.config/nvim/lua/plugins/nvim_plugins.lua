return {
  -- { dir = "~/nvim_plugins/foo", config = function() require("foo").setup() end },
  { dir = "~/nvim_plugins/hello_world.nvim", enabled = false, config = function() require "hello_world" end },
  { dir = "~/nvim_plugins/repler.nvim", config = function() require("repler").setup() end },
}
