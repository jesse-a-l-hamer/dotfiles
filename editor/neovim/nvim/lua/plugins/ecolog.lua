return {
  "ssstba/ecolog.nvim",
  -- Lazy loading is done internally
  lazy = false,
  opts = {
    integrations = {
      blink_cmp = true,
      snacks = {
        shelter = { mask_on_copy = false },
      },
      keys = {
        copy_value = "<C-y>", -- Copy variable value to clipboard
        copy_name = "<C-u>", -- Copy variable name to clipboard
        append_value = "<C-a>", -- Append value at cursor position
        append_name = "<CR>", -- Append name at cursor position
        edit_var = "<C-e>", -- Edit environment variable
      },
      layout = { -- Any Snacks layout configuration
        preset = "dropdown",
        preview = false,
      },
    },
    -- Enables shelter mode for sensitive values
    shelter = {
      configuration = {
        partial_mode = {
          show_start = 3, -- Show first 3 characters
          show_end = 3, -- Show last 3 characters
          min_mask = 3, -- Minimum masked characters
        },
        mask_char = "*", -- Character used for masking
        mask_length = nil,
        skip_comments = false,
      },
      modules = {
        cmp = true, -- Enabled to mask values in completion
        peek = false, -- Enable to mask values in peek view
        files = true, -- Enabled to mask values in file buffers
        telescope = false, -- Enable to mask values in telescope integration
        telescope_previewer = false, -- Enable to mask values in telescope preview buffers
        fzf = false, -- Enable to mask values in fzf picker
        fzf_previewer = false, -- Enable to mask values in fzf preview buffers
        snacks_previewer = false, -- Enable to mask values in snacks previewer
        snacks = false, -- Enable to mask values in snacks picker
      },
    },
    -- true by default, enables built-in types (database_url, url, etc.)
    types = true,
    path = vim.fn.getcwd(), -- Path to search for .env files
    preferred_environment = "development", -- Optional: prioritize specific env files
    -- Controls how environment variables are extracted from code and how cmp works
    provider_patterns = true, -- true by default, when false will not check provider patterns
    load_shell = {
      enabled = true,
      override = false,
      transform = function(key, value)
        return "[shell] " .. value
      end,
    },
  },
}
