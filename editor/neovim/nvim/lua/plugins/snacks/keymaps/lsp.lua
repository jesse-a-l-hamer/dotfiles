return { ---@type LazyKeysSpec[]
  -- goto
  {
    "<leader>lgd",
    function()
      Snacks.picker.lsp_definitions()
    end,
    desc = "[d]efinition",
  },
  {
    "<leader>lgD",
    function()
      Snacks.picker.lsp_declarations()
    end,
    desc = "[D]eclaration",
  },
  {
    "<leader>lgi",
    function()
      Snacks.picker.lsp_implementations()
    end,
    desc = "[i]mplementation",
  },
  {
    "<leader>lgt",
    function()
      Snacks.picker.lsp_type_definitions()
    end,
    desc = "[t]ype",
  },
  -- rename
  {
    "<leader>lrf",
    function()
      Snacks.rename.rename_file()
    end,
    desc = "[f]ile",
  },
  -- search
  {
    "<leader>lsr",
    function()
      Snacks.picker.lsp_references()
    end,
    nowait = true,
    desc = "[r]eferences",
  },
  {
    "<leader>lss",
    function()
      Snacks.picker.lsp_symbols()
    end,
    desc = "[s]ymbols (document)",
  },
  {
    "<leader>lsw",
    function()
      Snacks.picker.lsp_symbols()
    end,
    desc = "symbols ([w]orkspace)",
  },
}
