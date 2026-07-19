return {
  "echasnovski/mini.hipatterns",
  event = "BufReadPre",
  opts = function()
    local hi = require "mini.hipatterns"
    return {
      highlighters = {
        -- Resalta colores HEX (#RRGGBB) nativamente
        hex_color = hi.gen_highlighter.hex_color { priority = 2000 },
      },
    }
  end,
}
