local transparent_background = true
local accent_color = "maroon"
local dark_flavor = "macchiato"

---@module 'lazy'
---@module 'catppuccin'
return { ---@type LazyPluginSpec
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  init = function()
    vim.cmd.colorscheme "catppuccin"
  end,
  ---@type CatppuccinOptions
  opts = {
    background = {
      light = "latte",
      dark = dark_flavor,
    },
    dim_inactive = {
      enabled = not transparent_background,
      shade = "dark",
      percentage = 0.15,
    },
    integrations = {
      blink_cmp = {
        style = "bordered",
      },
      colorful_winsep = {
        enabled = true,
        color = accent_color,
      },
      diffview = true,
      flash = true,
      lsp_trouble = true,
      markdown = true,
      markview = true,
      mini = {
        enabled = false,
        indentscope_color = accent_color,
      },
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = { "bold", "italic" },
          hints = { "bold", "italic" },
          warnings = { "bold", "italic" },
          information = { "bold", "italic" },
          ok = { "bold", "italic" },
        },
        underlines = {
          errors = { "undercurl" },
          hints = { "undercurl" },
          warnings = { "undercurl" },
          information = { "undercurl" },
          ok = { "undercurl" },
        },
        inlay_hints = {
          background = true,
        },
      },
      noice = true,
      nvim_surround = true,
      render_markdown = false,
      snacks = { enabled = true, indent_scope_color = accent_color },
      telescope = { enabled = false },
      which_key = true,
    },
    kitty = true,
    -- term_colors = true,
    transparent_background = transparent_background,
    custom_highlights = function(colors)
      return {
        -- globals
        CursorLineNr = { fg = colors[accent_color] },
        FloatBorder = { fg = colors[accent_color] },
        Title = { fg = colors[accent_color] },
      }
    end,
  },
}
