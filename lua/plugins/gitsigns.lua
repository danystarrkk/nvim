return {
  "lewis6991/gitsigns.nvim",
  opts = function()
    return {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
      current_line_blame = false,
      current_line_blame_opts = { virt_text = true, virt_text_pos = "eol", delay = 700 },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end
        map("n", "]h", function()
          if vim.wo.diff then
            return "]c"
          end
          vim.schedule(function()
            gs.next_hunk()
          end)
          return "<Ignore>"
        end, { expr = true, desc = "Siguiente cambio (hunk)" })
        map("n", "[h", function()
          if vim.wo.diff then
            return "[c"
          end
          vim.schedule(function()
            gs.prev_hunk()
          end)
          return "<Ignore>"
        end, { expr = true, desc = "Anterior cambio (hunk)" })
        map("n", "<leader>rh", gs.reset_hunk, { desc = "Resetear (deshacer) hunk actual" })
        map("n", "<leader>ph", gs.preview_hunk, { desc = "Previsualizar cambios del hunk" })
        map("n", "<leader>gb", gs.blame_line, { desc = "Ver detalles completos de Git Blame" })
        map("n", "<leader>td", gs.toggle_deleted, { desc = "Mostrar/Ocultar código borrado" })
      end,
    }
  end,
}
