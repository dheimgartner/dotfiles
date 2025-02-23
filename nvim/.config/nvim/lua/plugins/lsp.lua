return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "saghen/blink.cmp",
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      local capabilities = require("blink.cmp").get_lsp_capabilities()
      -- TODO: loop over servers... See e.g., https://cmp.saghen.dev/installation
      require("lspconfig").lua_ls.setup { capabilities = capabilities }
      require("lspconfig").r_language_server.setup {
        capabilities = capabilities,
        cmd = { "R", "--slave", "-e", "options(languageserver.rich_documentation=FALSE); languageserver::run()" }  -- removes div wrapper and stuff
      }
      require("lspconfig").clangd.setup { capabilities = capabilities }
    end,
  }
}
