---@module 'snacks'

---@param wintype? "float"|"vertical"|"horizontal"
---@param use_ft? boolean whether to use the buffer ft to determine the command to run
---@param get_cmd? boolean when true, asks user to input the command to run in terminal
---@param cmd? string the command to execute when starting the terminal
local get_terminal = function(wintype, use_ft, get_cmd, cmd)
  local ft_commands = {
    python = "ipython",
  }

  return function()
    local opts = wintype and { win = { style = "terminal" } } or nil
    if opts then
      if wintype == "float" then
        opts.win["position"] = "float"
        opts.win["border"] = "rounded"
        opts.win.wo = { winbar = vim.v.count1 .. ": %{get(b:, 'term_title', '')}" }
      elseif wintype == "vertical" then
        opts.win["position"] = "right"
      else
        opts.win["position"] = "bottom"
      end
    end

    local ft = vim.bo.filetype

    if not cmd and not get_cmd and use_ft then
      if vim.tbl_contains(vim.tbl_keys(ft_commands), ft) then
        cmd = ft_commands[ft]
      else
        Snacks.notifier.notify(string.format("No command associated to filetype %s. Opening shell instead.", ft), "warn")
      end
    end

    if not cmd and get_cmd then
      cmd = vim.fn.input "Command?"
    end

    Snacks.terminal(cmd, opts)
  end
end

---@module 'lazy'
return { ---@type LazyKeysSpec[]
  {
    "<c-.>",
    get_terminal(),
    desc = "Toggle terminal (shell)",
  },
  {
    "<c-,>",
    get_terminal(nil, true),
    desc = "Toggle terminal (by filetype)",
  },
  {
    "<c-/>",
    get_terminal(nil, false, true),
    desc = "Toggle terminal (input command)",
  },
  {
    "<leader>..",
    get_terminal(),
    desc = "Shell",
  },
  {
    "<leader>.,",
    get_terminal(nil, true),
    desc = "By filetype",
  },
  {
    "<leader>./",
    get_terminal(nil, false, true),
    desc = "Input command",
  },
  {
    "<leader>.f.",
    get_terminal "float",
    desc = "Shell",
  },
  {
    "<leader>.f,",
    get_terminal("float", true),
    desc = "By filetype",
  },
  {
    "<leader>.f/",
    get_terminal("float", false, true),
    desc = "Input command",
  },
  {
    "<leader>.v.",
    get_terminal "vertical",
    desc = "Shell",
  },
  {
    "<leader>.v,",
    get_terminal("vertical", true),
    desc = "By filetype",
  },
  {
    "<leader>.v/",
    get_terminal("vertical", false, true),
    desc = "Input command",
  },
  {
    "<leader>.h.",
    get_terminal "horizontal",
    desc = "Shell",
  },
  {
    "<leader>.h,",
    get_terminal("horizontal", true),
    desc = "By filetype",
  },
  {
    "<leader>.h/",
    get_terminal("horizontal", false, true),
    desc = "Input command",
  },
}
