local styles_prefix = "plugins.snacks.styles."

return {
  ---@module 'snacks'
  ---@type table<string, snacks.win.Config>

  notification = require(styles_prefix .. "notification"),
}
