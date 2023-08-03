local t = require("mono-cterm").get_current_palette()

return {
  inactive = {
    a = { fg = t["white"].cterm, bg = t["black"].cterm },
    b = { fg = t["white"].cterm, bg = t["black"].cterm },
    c = { fg = t["white"].cterm, bg = t["black"].cterm },
    x = { fg = t["white"].cterm, bg = t["black"].cterm },
    y = { fg = t["white"].cterm, bg = t["black"].cterm },
    z = { fg = t["white"].cterm, bg = t["black"].cterm },
  },
  normal = {
    a = { fg = t["black"].cterm, bg = t["white"].cterm, bold = true },
    b = { fg = t["brightwhite"].cterm, bg = t["brightblack"].cterm },
    c = { fg = t["white"].cterm, bg = t["black"].cterm },
    x = { fg = t["white"].cterm, bg = t["black"].cterm },
    y = { fg = t["brightwhite"].cterm, bg = t["brightblack"].cterm },
    z = { fg = t["black"].cterm, bg = t["white"].cterm },
  },
  insert = {
    a = { fg = t["black"].cterm, bg = t["brightwhite"].cterm },
    z = { fg = t["black"].cterm, bg = t["brightwhite"].cterm },
  },
  command = {
    a = { fg = t["black"].cterm, bg = t["brightgreen"].cterm },
    z = { fg = t["black"].cterm, bg = t["brightgreen"].cterm },
  },
  replace = {
    a = { fg = t["black"].cterm, bg = t["red"].cterm },
    z = { fg = t["black"].cterm, bg = t["brightred"].cterm },
  },
  visual = {
    a = { fg = t["black"].cterm, bg = t["magenta"].cterm },
    z = { fg = t["black"].cterm, bg = t["brightmagenta"].cterm },
  }
}
