local ft_to_md_block = {
  lua = "lua",
  python = "python",
}

local wrap_as_code_block = function(notif)
  notif.msg = table.concat({ "\n", "```" .. ft_to_md_block[notif.ft], notif.msg, "```" }, "\n")
  notif.is_code_block = true
end

local unwrap_code_block = function(notif)
  if not notif.is_code_block then
    return notif
  end
  local lines = vim.split(notif.msg, "\n")
  return vim.tbl_extend("force", notif, { msg = table.concat(lines, "\n", 3, #lines - 1) })
end

---@module 'snacks'
return { ---@type snacks.notifier.Config
  timeout = 5000,
  ---@type fun(buf: number, notif: snacks.notifier.Notif, ctx: snacks.notifier.ctx)
  style = function(buf, notif, ctx)
    ctx.notifier.styles["compact"](buf, unwrap_code_block(notif), ctx)
    local should_wrap = not notif.is_code_block
      and notif.ft
      and vim.tbl_contains(vim.tbl_keys(ft_to_md_block), notif.ft)
      and not notif.updated
      and not notif.shown
    if should_wrap then
      wrap_as_code_block(notif)
    end
  end,
}
