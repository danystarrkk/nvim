-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
-- Emular el salto de línea de VS Code al presionar Enter entre etiquetas HTML
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "html", "javascriptreact", "typescriptreact", "php" },
  callback = function()
    vim.keymap.set("i", "<CR>", function()
      local line = vim.api.nvim_get_current_line()
      local col = vim.api.nvim_win_get_cursor(0)[2]

      -- Verifica si el cursor está exactamente entre '>' y '<'
      if col > 0 and line:sub(col, col + 1) == "><" then
        -- Simula presionar Enter (<CR>), escapar (<C-o>) y abrir nueva línea arriba (O)
        return "<CR><C-o>O"
      end

      -- Si no está entre etiquetas, hace un Enter normal
      -- Mantiene compatibilidad con mini.pairs si lo tienes activo
      local ok, mini_pairs = pcall(require, "mini.pairs")
      if ok then
        return mini_pairs.cr()
      end
      return "<CR>"
    end, { expr = true, buffer = true, replace_keycodes = true, desc = "Expansión de etiquetas HTML" })
  end,
})
