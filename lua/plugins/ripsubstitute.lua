return {
  "chrisgrieser/nvim-rip-substitute",
  cmd = "RipSubstitute",
  opts = {},
  keys = {
    {
      -- Atajo de teclado: Espacio + r + s (Rip Substitute)
      "<leader>rs",
      function()
        require("rip-substitute").sub()
      end,
      -- Funciona en modo Normal ("n") y modo Visual ("x")
      mode = { "n", "x" },
      desc = "Rip Substitute (Buscar y Reemplazar)",
    },
  },
}
