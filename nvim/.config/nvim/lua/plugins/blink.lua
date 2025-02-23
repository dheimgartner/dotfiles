return {
  {
    "saghen/blink.cmp",
    -- optional: provides snippets for the snippet source
    dependencies = "rafamadriz/friendly-snippets",

    -- use a release tag to download pre-built binaries
    version = "*",
    opts = {
      keymap = {
        preset = "super-tab",
        -- ["<C-CR>"] = { "select_and_accept", "fallback" },
      },
      appearance = {
        -- Sets the fallback highlight groups to nvim-cmp"s highlight groups
        -- Useful for when your theme doesn"t support blink.cmp
        -- Will be removed in a future release
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono",
      },
    },
  }
}
