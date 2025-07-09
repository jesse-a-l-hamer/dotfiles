return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    -- Required dependency for nvim-dap-ui
    "nvim-neotest/nvim-nio",
    -- Debugger-specific extensions
    "mfussenegger/nvim-dap-python",
  },
  keys = {
    {
      "<leader>dd",
      function()
        require("dap").continue()
      end,
      desc = "Start/Continue [d]ebugging",
    },
    {
      "<leader>di",
      function()
        require("dap").step_into()
      end,
      desc = "Step [i]nto",
    },
    {
      "<leader>do",
      function()
        require("dap").step_over()
      end,
      desc = "Step [o]ver",
    },
    {
      "<leader>dO",
      function()
        require("dap").step_out()
      end,
      desc = "Step [O]ut",
    },
    {
      "<leader>db",
      function()
        require("dap").toggle_breakpoint()
      end,
      desc = "Toggle [b]reakpoint",
    },
    {
      "<leader>dB",
      function()
        require("dap").set_breakpoint(vim.fn.input "Breakpoint condition: ")
      end,
      desc = "Set [B]reakpoint",
    },
    -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
    {
      "<leader>dr",
      function()
        require("dapui").toggle()
      end,
      desc = "See last session [r]esult",
    },
  },
  config = function()
    local dap = require "dap"
    local dapui = require "dapui"

    -- Dap UI setup
    -- For more information, see |:help nvim-dap-ui|
    dapui.setup {
      icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
      controls = {
        icons = {
          pause = "⏸",
          play = "▶",
          step_into = "⏎",
          step_over = "⏭",
          step_out = "⏮",
          step_back = "b",
          run_last = "▶▶",
          terminate = "⏹",
          disconnect = "⏏",
        },
      },
    }

    -- Change breakpoint icons
    local breakpoint_icons = vim.g.have_nerd_font
        and { Breakpoint = "", BreakpointCondition = "", BreakpointRejected = "", LogPoint = "", Stopped = " " }
      or { Breakpoint = "●", BreakpointCondition = "⊜", BreakpointRejected = "⊘", LogPoint = "◆", Stopped = "⭔" }
    for type, icon in pairs(breakpoint_icons) do
      local tp = "Dap" .. type
      local hl = (type == "Stopped") and "DapStop" or "DapBreak"
      vim.fn.sign_define(tp, { text = icon, texthl = hl, numhl = hl })
    end

    -- Setup for specific debuggers

    require("dap-python").setup "uv"

    dap.listeners.after.event_initialized["dapui_config"] = dapui.open
    dap.listeners.before.event_terminated["dapui_config"] = dapui.close
    dap.listeners.before.event_exited["dapui_config"] = dapui.close
  end,
}
