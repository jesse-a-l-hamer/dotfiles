return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  init = function()
    vim.cmd.colorscheme "catppuccin"
  end,
  opts = {
    flavour = "macchiato",
    dim_inactive = {
      enabled = true,
      shade = "dark",
      percentage = 0.15,
    },
    integrations = {
      blink_cmp = true,
      colorful_winsep = {
        enabled = true,
        color = "maroon",
      },
      fidget = true,
      indent_blankline = {
        enabled = true,
        scope_color = "maroon",
      },
      mini = {
        enabled = true,
        indentscope_color = "maroon",
      },
      which_key = true,
    },
  },
}
