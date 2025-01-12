return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      animate = { enabled = true },
      bigfile = { enabled = true },
      dashboard = { example = "advanced" },
      dim = { enabled = true },
      gitbrowse = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      lazygit = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scratch = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
      terminal = { enabled = true },
      toggle = { enabled = true },
      win = { enabled = true },
      words = { enabled = true },
      zen = { enabled = true },
    },
    keys = {
      {
        "<leader>bs",
        function()
          Snacks.scratch()
        end,
        desc = "[s]cratch",
      },
      {
        "<leader>bS",
        function()
          Snacks.scratch.select()
        end,
        desc = "[S]elect scratch",
      },
      {
        "<leader>nh",
        function()
          Snacks.notifier.show_history()
        end,
        desc = "[h]istory",
      },
      {
        "<leader>bd",
        function()
          Snacks.bufdelete()
        end,
        desc = "[d]elete",
      },
      {
        "<leader>fr",
        function()
          Snacks.rename.rename_file()
        end,
        desc = "[r]ename",
      },
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
      {
        "<leader>nd",
        function()
          Snacks.notifier.hide()
        end,
        desc = "[d]ismiss",
      },
      {
        "<leader>tt",
        function()
          Snacks.terminal()
        end,
        desc = "[t]oggle",
      },
      {
        "<c-/>",
        function()
          Snacks.terminal()
        end,
        desc = "which_key_ignore",
      },
      {
        "]]",
        function()
          Snacks.words.jump(vim.v.count1)
        end,
        desc = "Next Reference",
        mode = { "n", "t" },
      },
      {
        "[[",
        function()
          Snacks.words.jump(-vim.v.count1)
        end,
        desc = "Prev Reference",
        mode = { "n", "t" },
      },
      {
        "<leader>N",
        desc = "Neovim [N]ews",
        function()
          Snacks.win {
            file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
            width = 0.6,
            height = 0.6,
            wo = {
              spell = false,
              wrap = false,
              signcolumn = "yes",
              statuscolumn = " ",
              conceallevel = 3,
            },
          }
        end,
      },
      {
        "<leader>D",
        function()
          Snacks.dashboard { example = "advanced" }
        end,
        desc = "[D]ashboard",
      },
    },
    init = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "VeryLazy",
        callback = function()
          -- Setup some globals for debugging (lazy-loaded)
          _G.dd = function(...)
            Snacks.debug.inspect(...)
          end
          _G.bt = function()
            Snacks.debug.backtrace()
          end
          vim.print = _G.dd -- Override print to use snacks for `:=` command

          -- Create some toggle mappings
          Snacks.toggle.option("spell", { name = "[s]pelling" }):map "<leader>Ts"
          Snacks.toggle.option("wrap", { name = "[w]rap" }):map "<leader>Tw"
          Snacks.toggle.option("relativenumber", { name = "Relative [L]ine Numbers" }):map "<leader>TL"
          Snacks.toggle.diagnostics():map "<leader>Td"
          Snacks.toggle.line_number():map "<leader>Tl"
          Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map "<leader>Tc"
          Snacks.toggle.treesitter():map "<leader>TT"
          Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map "<leader>Tb"
          Snacks.toggle.inlay_hints():map "<leader>Th"
          Snacks.toggle.indent():map "<leader>Tg"
          Snacks.toggle.dim():map "<leader>TD"
          Snacks.toggle.zen():map "<leader>Tz"
          Snacks.toggle.zoom():map "<leader>TZ"
        end,
      })
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
      local function on_move(data)
        Snacks.rename.on_rename_file(data.source, data.destination)
      end
      local events = require "neo-tree.events"
      opts.event_handlers = opts.event_handlers or {}
      vim.list_extend(opts.event_handlers, {
        { event = events.FILE_MOVED, handler = on_move },
        { event = events.FILE_RENAMED, handler = on_move },
      })
    end,
  },
}
