---@module 'lazy'
return { ---@type LazyKeysSpec[]
  {
    "<leader>fb",
    function()
      Snacks.picker.buffers()
    end,
    desc = "[b]uffers",
  },
  {
    "<leader>fc",
    function()
      Snacks.picker.files { cwd = vim.fn.stdpath "config" }
    end,
    desc = "[c]onfig files",
  },
  {
    "<leader>ff",
    function()
      Snacks.picker.files()
    end,
    desc = "[f]iles",
  },
  {
    "<leader>fR",
    function()
      Snacks.picker.recent()
    end,
    desc = "[R]ecent",
  },
  {
    '<leader>f"',
    function()
      Snacks.picker.registers()
    end,
    desc = '["] registers',
  },
  {
    "<leader>fa",
    function()
      Snacks.picker.autocmds()
    end,
    desc = "[a]utocmds",
  },
  {
    "<leader>f:",
    function()
      Snacks.picker.command_history()
    end,
    desc = "[:] command history",
  },
  {
    "<leader>fC",
    function()
      Snacks.picker.commands()
    end,
    desc = "[C]ommands",
  },
  {
    "<leader>fd",
    function()
      Snacks.picker.diagnostics { filter = { buf = true } }
    end,
    desc = "[d]iagnostics (buffer)",
  },
  {
    "<leader>fD",
    function()
      Snacks.picker.diagnostics()
    end,
    desc = "[D]iagnostics (cwd)",
  },
  {
    "<leader>fh",
    function()
      Snacks.picker.help()
    end,
    desc = "[h]elp",
  },
  {
    "<leader>fH",
    function()
      Snacks.picker.highlights()
    end,
    desc = "[H]ighlights",
  },
  {
    "<leader>fi",
    function()
      Snacks.picker "icons"
    end,
    desc = "[i]cons",
  },
  {
    "<leader>fj",
    function()
      Snacks.picker.jumps()
    end,
    desc = "[j]umps",
  },
  {
    "<leader>fk",
    function()
      Snacks.picker.keymaps()
    end,
    desc = "[k]eymaps",
  },
  {
    "<leader>fl",
    function()
      Snacks.picker.loclist()
    end,
    desc = "[l]ocation list",
  },
  {
    "<leader>fM",
    function()
      Snacks.picker.man()
    end,
    desc = "[M]an pages",
  },
  {
    "<leader>fm",
    function()
      Snacks.picker.marks()
    end,
    desc = "[m]arks",
  },
  {
    "<leader>fq",
    function()
      Snacks.picker.qflist()
    end,
    desc = "[q]uickfix list",
  },
  {
    "<leader>fP",
    function()
      Snacks.picker.projects()
    end,
    desc = "[P]rojects",
  },
  {
    "<leader>fz",
    function()
      Snacks.picker.zoxide()
    end,
    desc = "[z]oxide projects",
  },
  {
    "<leader>fu",
    function()
      Snacks.picker "undo"
    end,
    desc = "[u]ndo",
  },
  {
    "<leader>fs",
    function()
      Snacks.picker "spelling"
    end,
    desc = "[s]pelling",
  },
  {
    "<leader>fS",
    function()
      Snacks.picker.search_history()
    end,
    desc = "[S]earch history",
  },
  {
    "<leader>fL",
    function()
      Snacks.picker "lazy"
    end,
    desc = "[L]azy plugin specs",
  },
  {
    "<leader>fn",
    function()
      Snacks.picker "notifications"
    end,
    desc = "[n]otifications",
  },
  {
    "<leader>ft",
    function()
      ---@diagnostic disable-next-line: undefined-field
      Snacks.picker.todo_comments()
    end,
    desc = "[t]odo",
  },
  {
    "<leader>fT",
    function()
      ---@diagnostic disable-next-line: undefined-field
      Snacks.picker.todo_comments { keywords = { "TODO", "FIX", "FIXME" } }
    end,
    desc = "[T]odo/Fix/Fixme",
  },
  -- pickers
  {
    "<leader>fpp",
    function()
      Snacks.picker.pickers()
    end,
    desc = "[p]ickers",
  },
  {
    "<leader>fpP",
    function()
      Snacks.picker "picker_preview"
    end,
    desc = "[P]reviews",
  },
  {
    "<leader>fpl",
    function()
      Snacks.picker "picker_layouts"
    end,
    desc = "[l]ayouts",
  },
  {
    "<leader>fpf",
    function()
      Snacks.picker "picker_format"
    end,
    desc = "[f]ormats",
  },
  {
    "<leader>fpa",
    function()
      Snacks.picker "picker_actions"
    end,
    desc = "[a]ctions",
  },
}
