return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    cmdline = {
      view = "cmdline_popup",
    },

    views = {
      cmdline_popup = {
        position = {
          row = "10%",
          col = "50%",
        },
        size = {
          min_width = 60,
          width = "auto",
        },
        border = {
          style = "rounded",
        },
        win_options = {
          winhighlight = {
            Normal = "Normal",
            FloatBorder = "FloatBorder",
          },
        },
      },

      hover = {
        enter = false,
      },
    },

    notify = { enabled = true },

    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },

      -- Firma desactivada para evitar el conflicto de robo de foco
      signature = {
        enabled = false,
      },

      -- Hover habilitado para ver documentación sin robar el foco
      hover = {
        enabled = true,
      },
    },

    routes = {
      {
        filter = {
          any = {
            { find = "avante/sidebar.lua" },
            { find = "attempt to index field 'result' %(a nil value%)" },
          },
        },
        opts = { skip = true },
      },
    },
  },

  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
}
