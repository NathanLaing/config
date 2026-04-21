return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  keys = {
    {
      '\\',
      function()
        -- If we are in Neo-tree, close it.
        if vim.bo.filetype == 'neo-tree' then
          vim.cmd.Neotree 'close'
        else
          -- Otherwise, open it and reveal the current file
          vim.cmd.Neotree 'reveal'
        end
      end,
      desc = 'NeoTree Reveal (Smart)',
      silent = true,
    },
  },
  opts = {
    -- GLOBAL SETTINGS
    enable_git_status = true,
    enable_diagnostics = true,

    -- VISUALS
    default_component_configs = {
      indent = {
        with_markers = true,
        indent_marker = '│',
        last_indent_marker = '└',
        indent_size = 2,
        padding = 1,
        with_expanders = true,
        expander_collapsed = '▶',
        expander_expanded = '▼',
      },
      icon = {
        folder_closed = '',
        folder_open = '',
        folder_empty = '󰜌',
      },
      name = {
        use_git_status_colors = true,
      },
      git_status = {
        symbols = {
          added = '',
          modified = '',
          deleted = '✖',
          renamed = '󰁕',
          untracked = '',
          ignored = '',
          unstaged = '󰄱',
          staged = '',
          conflict = '',
        },
      },
      diagnostics = {
        symbols = {
          hint = '',
          info = '',
          warn = '',
          error = '',
        },
        highlights = {
          hint = 'DiagnosticSignHint',
          info = 'DiagnosticSignInfo',
          warn = 'DiagnosticSignWarn',
          error = 'DiagnosticSignError',
        },
      },
    },

    -- GLOBAL WINDOW CONFIG
    window = {
      position = 'right',
      width = 35,
      mappings = {
        ['<space>'] = 'none',
      },
    },

    -- FILESYSTEM SPECIFIC SETTINGS
    filesystem = {
      bind_to_cwd = false,
      follow_current_file = {
        enabled = true,
        leave_dirs_open = true,
      },
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_by_name = {
          '.git',
        },
      },
    },
  },
}
