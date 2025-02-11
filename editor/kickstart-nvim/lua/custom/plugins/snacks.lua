return {
  ---@module 'snacks'
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
      explorer = {
        enabled = true,
        replace_netrw = true,
      },
      gitbrowse = { enabled = true },
      image = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      lazygit = { enabled = true },
      notifier = {
        enabled = true,
        timeout = 3000,
      },
      picker = {
        sources = {
          explorer = {},
        },
      },
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
      styles = {
        notification = {
          wo = { wrap = true },
        },
      },
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
        "<leader>lrf",
        function()
          Snacks.rename.rename_file()
        end,
        desc = "[f]ile",
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
      -- picker keymaps
      {
        "<leader>,",
        function()
          Snacks.picker.buffers()
        end,
        desc = "Find Buffers",
      },
      {
        "<leader>/",
        function()
          Snacks.picker.grep()
        end,
        desc = "Grep",
      },
      {
        "<leader>:",
        function()
          Snacks.picker.command_history()
        end,
        desc = "Command History",
      },
      {
        "<leader><space>",
        function()
          Snacks.picker.files()
        end,
        desc = "Find Files",
      },
      {
        "<leader>e",
        function()
          Snacks.picker.explorer()
        end,
        desc = "[e]xplorer",
      },
      -- find
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
          Snacks.picker.files { cwd = "$HOME/dotfiles/editor/kickstart-nvim" }
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
      -- git
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
      -- Grep
      {
        "<leader>sl",
        function()
          Snacks.picker.lines()
        end,
        desc = "[l]ines in buffer",
      },
      {
        "<leader>sb",
        function()
          Snacks.picker.grep_buffers()
        end,
        desc = "[b]uffers",
      },
      {
        "<leader>sg",
        function()
          Snacks.picker.grep()
        end,
        desc = "[g]rep",
      },
      {
        "<leader>sw",
        function()
          Snacks.picker.grep_word()
        end,
        desc = "[w]ord",
        mode = { "n", "x" },
      },
      -- search
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
        "<leader>r",
        function()
          Snacks.picker.resume()
        end,
        desc = "[r]esume find/search",
      },
      {
        "<leader>fq",
        function()
          Snacks.picker.qflist()
        end,
        desc = "[q]uickfix list",
      },
      {
        "<leader>TC",
        function()
          Snacks.picker.colorschemes()
        end,
        desc = "[C]olorschemes",
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
      -- LSP
      {
        "<leader>lgd",
        function()
          Snacks.picker.lsp_definitions()
        end,
        desc = "[d]efinition",
      },
      {
        "<leader>lgD",
        function()
          Snacks.picker.lsp_declarations()
        end,
        desc = "[D]eclaration",
      },
      {
        "<leader>lsr",
        function()
          Snacks.picker.lsp_references()
        end,
        nowait = true,
        desc = "[r]eferences",
      },
      {
        "<leader>lgi",
        function()
          Snacks.picker.lsp_implementations()
        end,
        desc = "[i]mplementation",
      },
      {
        "<leader>lgt",
        function()
          Snacks.picker.lsp_type_definitions()
        end,
        desc = "[t]ype",
      },
      {
        "<leader>lss",
        function()
          Snacks.picker.lsp_symbols()
        end,
        desc = "[s]ymbols (document)",
      },
      {
        "<leader>lsw",
        function()
          Snacks.picker.lsp_symbols()
        end,
        desc = "symbols ([w]orkspace)",
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
  -- {
  --   "nvim-neo-tree/neo-tree.nvim",
  --   opts = function(_, opts)
  --     local function on_move(data)
  --       Snacks.rename.on_rename_file(data.source, data.destination)
  --     end
  --     local events = require "neo-tree.events"
  --     opts.event_handlers = opts.event_handlers or {}
  --     vim.list_extend(opts.event_handlers, {
  --       { event = events.FILE_MOVED, handler = on_move },
  --       { event = events.FILE_RENAMED, handler = on_move },
  --     })
  --   end,
  -- },
}
