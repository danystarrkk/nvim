return {
  "nvim-tree/nvim-tree.lua",
  opts = {
    hijack_cursor = true,
    sync_root_with_cwd = true,
    update_focused_file = {
      enable = true,
      update_root = false,
    },
    view = {
      width = 30,
      preserve_window_proportions = true,
      side = "left",
    },

    diagnostics = {
      enable = true,
      show_on_dirs = true,
      icons = {
        hint = "󰌵",
        info = "",
        warning = "",
        error = "",
      },
    },

    modified = {
      enable = true,
    },

    renderer = {
      root_folder_label = false,

      group_empty = true,
      highlight_git = true,

      highlight_opened_files = "name",
      highlight_modified = "icon",

      indent_markers = {
        enable = true,
        icons = {
          corner = "└ ",
          edge = "│ ",
          item = "├ ",
          none = "  ",
        },
      },
      icons = {
        show = {
          file = true,
          folder = true,
          folder_arrow = true,
          git = true,
          modified = true,
          diagnostics = true,
        },
        glyphs = {
          default = "󰈚",
          symlink = "",
          modified = "●",
          folder = {
            arrow_closed = "",
            arrow_open = "",
            default = "",
            empty = "",
            empty_open = "",
            open = "",
            symlink = "",
            symlink_open = "",
          },
          git = {
            unstaged = "✗",
            staged = "✓",
            unmerged = "",
            renamed = "➜",
            untracked = "★",
            deleted = "",
            ignored = "◌",
          },
        },
      },
    },
    filters = {
      dotfiles = false,
      custom = { "^\\.git$" },
    },
  },
}
