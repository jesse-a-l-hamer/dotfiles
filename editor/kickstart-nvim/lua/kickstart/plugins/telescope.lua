-- NOTE: Plugins can specify dependencies.
--
-- The dependencies are proper plugin specifications as well - anything
-- you do for a plugin at the top level, you can do for a dependency.
--
-- Use the `dependencies` key to specify the dependencies of a particular plugin

return {
  { -- Fuzzy Finder (files, lsp, etc)
    "nvim-telescope/telescope.nvim",
    event = "VimEnter",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = function()
          return vim.fn.executable "make" == 1
        end,
      },
      { "nvim-telescope/telescope-ui-select.nvim" },
      { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
    },
    config = function()
      require("telescope").setup {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown(),
          },
        },
      }
      -- Enable Telescope extensions if they are installed
      pcall(require("telescope").load_extension, "fzf")
      pcall(require("telescope").load_extension, "ui-select")

      -- See `:help telescope.builtin`
      local builtin = require "telescope.builtin"
      vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[h]elp" })
      vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[k]eymaps" })
      vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[f]iles" })
      vim.keymap.set("n", "<leader>sT", builtin.builtin, { desc = "[T]elescope" })
      vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[w]ord" })
      vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[g]rep" })
      vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[d]iagnostics" })
      vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[r]esume" })
      vim.keymap.set("n", "<leader>sR", builtin.oldfiles, { desc = "[R]ecent files" })
      vim.keymap.set("n", "<leader>sb", builtin.buffers, { desc = "[b]uffers" })

      -- Slightly advanced example of overriding default behavior and theme
      vim.keymap.set("n", "<leader>/", function()
        -- You can pass additional configuration to Telescope to change the theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = "[/] Fuzzily search in current buffer" })

      -- It's also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      vim.keymap.set("n", "<leader>so", function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = "Live Grep in Open Files",
        }
      end, { desc = "[o]pen files" })

      -- Shortcut for searching your Neovim configuration files
      vim.keymap.set("n", "<leader>sc", function()
        builtin.find_files { cwd = "$HOME/dotfiles/editor/kickstart-nvim" }
      end, { desc = "[c]onfig files" })
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
