return { ---@type LazyKeysSpec[]
  -- goto
  {
    "<leader>lgd",
    function()
      Snacks.picker.lsp_definitions()
    end,
    desc = "Definition",
  },
  {
    "<leader>lgD",
    function()
      Snacks.picker.lsp_declarations()
    end,
    desc = "Declaration",
  },
  {
    "<leader>lgi",
    function()
      Snacks.picker.lsp_implementations()
    end,
    desc = "Implementation",
  },
  {
    "<leader>lgt",
    function()
      Snacks.picker.lsp_type_definitions()
    end,
    desc = "Type",
  },
  -- rename
  {
    "<leader>lrf",
    function()
      Snacks.rename.rename_file()
    end,
    desc = "File",
  },
  -- search
  {
    "<leader>lsr",
    function()
      Snacks.picker.lsp_references()
    end,
    nowait = true,
    desc = "References",
  },
  {
    "<leader>lss",
    function()
      Snacks.picker.lsp_symbols()
    end,
    desc = "Document Symbols",
  },
  {
    "<leader>lsw",
    function()
      Snacks.picker.lsp_workspace_symbols()
    end,
    desc = "Workspace Symbols",
  },
}
