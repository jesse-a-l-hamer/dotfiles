return {
  "jackplus-xyz/monaspace.nvim",
  lazy = false,
  opts = {
    style_map = {
      bold = {},
      italic = {
        ["@comment"] = true,
        Comment = true,
      },
      bold_italic = {
        Type = true,
        ["@lsp.type.comment"] = true,
      },
    },
  },
}
