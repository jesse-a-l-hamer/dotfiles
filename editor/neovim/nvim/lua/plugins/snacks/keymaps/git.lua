---@module 'lazy'
---@module 'snacks'
return { ---@type LazyKeysSpec[]
  {
    "<leader>gB",
    function()
      Snacks.gitbrowse()
    end,
    desc = "Browse Repository",
    mode = { "n", "v" },
  },
  {
    "<leader>gb",
    function()
      Snacks.git.blame_line()
    end,
    desc = "Blame line",
  },
  {
    "<leader>ggf",
    function()
      Snacks.lazygit.log_file()
    end,
    desc = "File commit log",
  },
  {
    "<leader>ggg",
    function()
      Snacks.lazygit()
    end,
    desc = "Open Lazygit",
  },
  {
    "<leader>ggl",
    function()
      Snacks.lazygit.log()
    end,
    desc = "Repo commit log",
  },
  -- find
  {
    "<leader>gfb",
    function()
      Snacks.picker "git_branches"
    end,
    desc = "Branches",
  },
  {
    "<leader>gfd",
    function()
      Snacks.picker.git_diff()
    end,
    desc = "Diff",
  },
  {
    "<leader>gff",
    function()
      Snacks.picker.git_files()
    end,
    desc = "Files",
  },
  {
    "<leader>gfl",
    function()
      Snacks.picker.git_log()
    end,
    desc = "Log",
  },
  {
    "<leader>gfc",
    function()
      Snacks.picker.git_log_file()
    end,
    desc = "Current file log",
  },
  {
    "<leader>gfL",
    function()
      Snacks.picker.git_log_line()
    end,
    desc = "Current line log",
  },
  {
    "<leader>gfs",
    function()
      Snacks.picker.git_status()
    end,
    desc = "Status",
  },
  {
    "<leader>gfS",
    function()
      Snacks.picker.git_stash()
    end,
    desc = "Stash",
  },
}
