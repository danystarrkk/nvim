require "nvchad.options"

-- Configuración base
vim.opt.spell = true
vim.opt.spelllang = { "es", "en" }
vim.opt.relativenumber = true

-- Auto comando para abrir directorios al iniciar
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local arg = vim.fn.argv(0)
    if arg ~= "" and vim.fn.isdirectory(arg) == 1 then
      vim.cmd("cd " .. vim.fn.escape(arg, " \\"))
    end
  end,
})

-- Autocomando definitivo para borrar buffers vacíos y buffers de directorios
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    local current_buf = vim.api.nvim_get_current_buf()
    local current_name = vim.api.nvim_buf_get_name(current_buf)

    -- Solo actuamos si el buffer al que entramos es un archivo real (tiene texto y no es carpeta)
    if current_name ~= "" and vim.fn.isdirectory(current_name) == 0 then
      for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
        -- Evitamos borrar el buffer en el que estamos trabajando
        if vim.api.nvim_buf_is_valid(bufnr) and bufnr ~= current_buf then
          local name = vim.api.nvim_buf_get_name(bufnr)

          -- Detectamos si es un buffer de directorio (como el de tu imagen)
          local is_dir = vim.fn.isdirectory(name) == 1
          -- Detectamos si es un buffer en blanco sin guardar
          local is_empty_unnamed = name == "" and not vim.bo[bufnr].modified

          if is_dir or is_empty_unnamed then
            -- vim.schedule asegura que NvChad termine de cargar la interfaz antes de borrarlo
            vim.schedule(function()
              pcall(vim.api.nvim_buf_delete, bufnr, { force = true })
            end)
          end
        end
      end
    end
  end,
})
