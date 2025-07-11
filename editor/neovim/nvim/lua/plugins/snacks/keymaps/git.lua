---@module 'lazy'
return { ---@type LazyKeysSpec[]
  {
    "<leader>gB",
    function()
      Snacks.gitbrowse()
    end,
    desc = "[B]rowse",
    mode = { "n", "v" },
  },
  {
    "<leader>gb",
    function()
      Snacks.git.blame_line()
    end,
    desc = "[b]lame line",
  },
  {
    "<leader>gf",
    function()
      Snacks.lazygit.log_file()
    end,
    desc = "Lazygit current [f]ile history",
  },
  {
    "<leader>gg",
    function()
      Snacks.lazygit()
    end,
    desc = "Lazy[g]it",
  },
  {
    "<leader>gl",
    function()
      Snacks.lazygit.log()
    end,
    desc = "Lazygit [l]og (cwd)",
  },
  -- find
  {
    "<leader>gfb",
    function()
      Snacks.picker "git_branches"
    end,
    desc = "[b]ranches",
  },
  {
    "<leader>gfd",
    function()
      Snacks.picker.git_diff()
    end,
    desc = "[d]iff",
  },
  {
    "<leader>gff",
    function()
      Snacks.picker.git_files()
    end,
    desc = "[f]iles",
  },
  {
    "<leader>gfl",
    function()
      Snacks.picker.git_log()
    end,
    desc = "[l]og",
  },
  {
    "<leader>gfc",
    function()
      Snacks.picker.git_log_file()
    end,
    desc = "[c]urrent file log",
  },
  {
    "<leader>gfL",
    function()
      Snacks.picker.git_log_line()
    end,
    desc = "current [L]ine log",
  },
  {
    "<leader>gfs",
    function()
      Snacks.picker.git_status()
    end,
    desc = "[s]tatus",
  },
  {
    "<leader>gfS",
    function()
      Snacks.picker.git_stash()
    end,
    desc = "[S]tash",
  },
}
