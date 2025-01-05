return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = true,
  ---@type CatppuccinOptions
  opts = {
    dim_inactive = {
      enabled = true,
      shade = "dark",
      percentage = 0.15,
    },
    integrations = {
      aerial = true,
      alpha = true,
      blink_cmp = true,
      dap = true,
      dap_ui = true,
      gitsigns = true,
      grug_far = true,
      illuminate = true,
      indent_blankline = {
        enabled = true,
        scope_color = "sapphire",
        colored_indent_levels = true,
      },
      markdown = true,
      mason = true,
      native_lsp = { enabled = true },
      neotree = true,
      notify = true,
      nvim_surround = true,
      rainbow_delimiters = true,
      render_markdown = true,
      semantic_tokens = true,
      symbols_outline = true,
      telescope = true,
      treesitter = true,
      treesitter_context = true,
      ts_rainbow = false,
      ufo = true,
      which_key = true,
      window_picker = true,
      colorful_winsep = { enabled = true, color = "maroon" },
    },
    flavour = "macchiato",
    transparent_background = false,
  },
  specs = {
    {
      "akinsho/bufferline.nvim",
      optional = true,
      opts = function(_, opts)
        return require("astrocore").extend_tbl(opts, {
          highlights = require("catppuccin.groups.integrations.bufferline").get(),
        })
      end,
    },
    {
      "nvim-telescope/telescope.nvim",
      optional = true,
      opts = {
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      },
    },
  },
}
