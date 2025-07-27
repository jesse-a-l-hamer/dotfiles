---@module 'snacks'
---@module 'lazy'

local snacks_config_dir = "lua/plugins/snacks/"
local snacks_component_config_pattern = snacks_config_dir .. "*.lua"
local snacks_components_with_configs = vim
  .iter(vim.api.nvim_get_runtime_file(snacks_component_config_pattern, true))
  :map(function(file)
    return vim.fs.basename(file):sub(1, -(#".lua" + 1))
  end)
  :totable()

---@param name string name of Snacks component config module to load
---@return any|table<"enabled", true> # loaded config module if a module with given name is found, otherwise the named Snacks component is simply enabled with defaults
local get_snacks_component_config = function(name)
  if vim.tbl_contains(snacks_components_with_configs, name) then
    return require("plugins.snacks." .. name)
  end
  return { enabled = true }
end

---@return table<string, snacks.win.Config> # table of custom window styles
local get_styles = function()
  local style_pattern = snacks_config_dir .. "styles/*.lua"
  local style_prefix = "plugins.snacks.styles."
  local styles = {}

  for _, file in ipairs(vim.api.nvim_get_runtime_file(style_pattern, true)) do
    local style_module = vim.fs.basename(file):sub(1, -(#".lua" + 1))
    styles[style_module] = require(style_prefix .. style_module)
  end

  return styles
end

---@return LazyKeysSpec[] # returns table of loaded keymaps from snacks/keymaps/ dir
local get_keys = function()
  local keymaps_pattern = snacks_config_dir .. "keymaps/*.lua"
  local keymaps_prefix = "plugins.snacks.keymaps."
  local keys = {}

  for _, file in ipairs(vim.api.nvim_get_runtime_file(keymaps_pattern, true)) do
    local keymaps_module = vim.fs.basename(file):sub(1, -(#".lua" + 1))
    vim.list_extend(keys, require(keymaps_prefix .. keymaps_module))
  end

  return keys
end

local enable_toggles = function()
  local toggles_pattern = snacks_config_dir .. "toggles/*.lua"
  local toggles_prefix = "plugins.snacks.toggles."
  for _, file in ipairs(vim.api.nvim_get_runtime_file(toggles_pattern, true)) do
    local toggle_module = vim.fs.basename(file):sub(1, -(#".lua" + 1))
    require(toggles_prefix .. toggle_module)
  end
end

return { ---@type LazyPluginSpec
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    animate = get_snacks_component_config "animate",
    bigfile = get_snacks_component_config "bigfile",
    dashboard = get_snacks_component_config "dashboard",
    dim = get_snacks_component_config "dim",
    explorer = get_snacks_component_config "explorer",
    gitbrowse = get_snacks_component_config "gitbrowse",
    image = get_snacks_component_config "image",
    indent = get_snacks_component_config "indent",
    input = get_snacks_component_config "input",
    lazygit = get_snacks_component_config "lazygit",
    notifier = get_snacks_component_config "notifier",
    picker = get_snacks_component_config "picker",
    profiler = get_snacks_component_config "profiler",
    quickfile = get_snacks_component_config "quickfile",
    scope = get_snacks_component_config "scope",
    scratch = get_snacks_component_config "scratch",
    scroll = get_snacks_component_config "scroll",
    statuscolumn = get_snacks_component_config "statuscolumn",
    terminal = get_snacks_component_config "terminal",
    toggle = get_snacks_component_config "toggle",
    win = get_snacks_component_config "win",
    words = get_snacks_component_config "words",
    zen = get_snacks_component_config "zen",
    styles = get_styles(),
  },
  keys = get_keys(),
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        -- Setup some globals for debugging (lazy-loaded)
        _G.dd = function(...)
          Snacks.debug.inspect(...)
        end
        _G.bt = function(msg, opts)
          Snacks.debug.backtrace(msg, opts)
        end
        vim.print = _G.dd -- Override print to use snacks for `:=` command

        enable_toggles()
      end,
    })
  end,
}
