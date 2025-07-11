local keymaps_prefix = "plugins.snacks.keymaps."

---@module 'lazy'
return vim
  .iter({ ---@type LazyKeysSpec[][]
    require(keymaps_prefix .. "buffer"),
    require(keymaps_prefix .. "find"),
    require(keymaps_prefix .. "git"),
    require(keymaps_prefix .. "lsp"),
    require(keymaps_prefix .. "notifications"),
    require(keymaps_prefix .. "profiler"),
    require(keymaps_prefix .. "search"),
    require(keymaps_prefix .. "terminal"),
    require(keymaps_prefix .. "top"),
    require(keymaps_prefix .. "words"),
  })
  :flatten()
  :totable()
