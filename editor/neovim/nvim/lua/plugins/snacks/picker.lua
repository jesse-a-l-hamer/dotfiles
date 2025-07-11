---@module 'snacks'

local presets_dir = "lua/plugins/snacks/picker_presets/"
local picker_presets = "plugins.snacks.picker_presets."

---@param preset_type string name of preset type whose configs to load
---@return table<string, any> # mapping from preset names to preset configs
local load_presets_of_type = function(preset_type)
  local presets_of_type = {}
  local preset_pattern = presets_dir .. preset_type .. "/*.lua"
  local preset_files = vim.api.nvim_get_runtime_file(preset_pattern, true)
  for _, file in ipairs(preset_files) do
    local preset = vim.fs.basename(file):sub(1, -(#".lua" + 1))
    presets_of_type[preset] = require(picker_presets .. preset_type .. "." .. preset)
  end
  return presets_of_type
end

---@return table<string, table<string, any>> # mapping from preset type names to mappings of preset names to preset configs
local load_presets = function()
  local preset_type_dir_pattern = presets_dir .. "*"
  local preset_type_dirs = vim.api.nvim_get_runtime_file(preset_type_dir_pattern, true)

  local presets = {}
  for _, preset_type_dir in ipairs(preset_type_dirs) do
    local preset_type = vim.fs.basename(preset_type_dir)
    presets[preset_type] = load_presets_of_type(preset_type)
  end

  return presets
end

-- put non-preset picker configs here
local picker_config = { ---@type snacks.picker.Config
}

return vim.tbl_extend("keep", picker_config, load_presets())
