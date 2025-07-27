---@module 'lazy'
---@module 'snacks'
return { ---@type LazyKeysSpec[]
  {
    "<leader>fb",
    function()
      Snacks.picker.buffers()
    end,
    desc = "Buffers",
  },
  {
    "<leader>fc",
    function()
      Snacks.picker.files { cwd = vim.fn.stdpath "config" }
    end,
    desc = "Config files",
  },
  {
    "<leader>fC",
    function()
      Snacks.picker.colorschemes()
    end,
    desc = "Colorschemes",
  },
  {
    "<leader>ff",
    function()
      Snacks.picker.files()
    end,
    desc = "Files",
  },
  {
    "<leader>fR",
    function()
      Snacks.picker.recent()
    end,
    desc = "Recent files",
  },
  {
    '<leader>f"',
    function()
      Snacks.picker.registers()
    end,
    desc = "Registers",
  },
  {
    "<leader>fa",
    function()
      Snacks.picker.autocmds()
    end,
    desc = "Autocmds",
  },
  {
    "<leader>f:",
    function()
      Snacks.picker.commands()
    end,
    desc = "Commands",
  },
  {
    "<leader>fd",
    function()
      Snacks.picker.diagnostics { filter = { buf = true } }
    end,
    desc = "Diagnostics (buffer)",
  },
  {
    "<leader>fD",
    function()
      Snacks.picker.diagnostics()
    end,
    desc = "Diagnostics (cwd)",
  },
  {
    "<leader>fh",
    function()
      Snacks.picker.help()
    end,
    desc = "Help",
  },
  {
    "<leader>fH",
    function()
      Snacks.picker.highlights()
    end,
    desc = "Highlights",
  },
  {
    "<leader>fi",
    function()
      Snacks.picker "icons"
    end,
    desc = "Icons",
  },
  {
    "<leader>fj",
    function()
      Snacks.picker.jumps()
    end,
    desc = "Jumps",
  },
  {
    "<leader>fk",
    function()
      Snacks.picker.keymaps()
    end,
    desc = "Keymaps",
  },
  {
    "<leader>fl",
    function()
      Snacks.picker.loclist()
    end,
    desc = "Location list",
  },
  {
    "<leader>fM",
    function()
      Snacks.picker.man()
    end,
    desc = "Man pages (system)",
  },
  {
    "<leader>fm",
    function()
      Snacks.picker.marks()
    end,
    desc = "Marks",
  },
  {
    "<leader>fq",
    function()
      Snacks.picker.qflist()
    end,
    desc = "Quickfix list",
  },
  {
    "<leader>fp",
    function()
      Snacks.picker "lazy"
    end,
    desc = "Lazy plugin specs",
  },
  {
    "<leader>fP",
    function()
      Snacks.picker.projects()
    end,
    desc = "Projects",
  },
  {
    "<leader>fz",
    function()
      Snacks.picker.zoxide()
    end,
    desc = "zoxide projects",
  },
  {
    "<leader>fu",
    function()
      Snacks.picker "undo"
    end,
    desc = "Undo",
  },
  {
    "<leader>fs",
    function()
      Snacks.picker "spelling"
    end,
    desc = "Spelling",
  },
  {
    "<leader>fS",
    function()
      Snacks.picker.search_history()
    end,
    desc = "Search history",
  },
  {
    "<leader>fn",
    function()
      Snacks.picker "notifications"
    end,
    desc = "Notifications",
  },
  {
    "<leader>ft",
    function()
      ---@diagnostic disable-next-line: undefined-field
      Snacks.picker.todo_comments()
    end,
    desc = "Todo comments (all)",
  },
  {
    "<leader>fT",
    function()
      ---@diagnostic disable-next-line: undefined-field
      Snacks.picker.todo_comments { keywords = { "TODO", "FIX", "FIXME" } }
    end,
    desc = "Todo comments (TODO / FIX / FIXME)",
  },
  -- pickers
  {
    "<leader>fpp",
    function()
      Snacks.picker.pickers()
    end,
    desc = "Pickers",
  },
  {
    "<leader>fpP",
    function()
      Snacks.picker "picker_preview"
    end,
    desc = "Previews",
  },
  {
    "<leader>fpl",
    function()
      Snacks.picker "picker_layouts"
    end,
    desc = "Layouts",
  },
  {
    "<leader>fpf",
    function()
      Snacks.picker "picker_format"
    end,
    desc = "Formats",
  },
  {
    "<leader>fpa",
    function()
      Snacks.picker "picker_actions"
    end,
    desc = "Actions",
  },
  {
    "<leader>f.",
    function()
      Snacks.picker.buffers {
        hidden = true,
        filter = {
          filter = function(item, _)
            return item.file and vim.startswith(item.file, "term://")
          end,
        },
        title = "Open Terminals",
        confirm = function(_, item)
          vim
            .tbl_filter(function(t)
              return t.buf == item.buf
            end, Snacks.terminal.list())[1]
            :show()
        end,
      }
    end,
    desc = "Open Terminals",
  },
}
