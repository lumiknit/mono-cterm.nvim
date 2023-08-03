local t = require("mono-cterm").get_current_palette()

return {
  inactive = {
    a = { ctermfg = t["white"].cterm, ctermbg = t["black"].cterm },
    b = { ctermfg = t["white"].cterm, ctermbg = t["black"].cterm },
    c = { ctermfg = t["white"].cterm, ctermbg = t["black"].cterm },
    x = { ctermfg = t["white"].cterm, ctermbg = t["black"].cterm },
    y = { ctermfg = t["white"].cterm, ctermbg = t["black"].cterm },
    z = { ctermfg = t["white"].cterm, ctermbg = t["black"].cterm },
  },
  normal = {
    a = { ctermfg = t["black"].cterm, ctermbg = t["white"].cterm, bold = true },
    b = { ctermfg = t["brightwhite"].cterm, ctermbg = t["black"].cterm },
    c = { ctermfg = t["white"].cterm, ctermbg = t["black"].cterm },
    x = { ctermfg = t["white"].cterm, ctermbg = t["black"].cterm },
    y = { ctermfg = t["brightwhite"].cterm, ctermbg = t["black"].cterm },
    z = { ctermfg = t["black"].cterm, ctermbg = t["white"].cterm },
  },
  insert = {
    a = { ctermfg = t["black"].cterm, ctermbg = t["brightwhite"].cterm },
  },
  replace = {
    a = { ctermfg = t["black"].cterm, ctermbg = t["red"].cterm },
  },
  visual = {
    a = { ctermfg = t["black"].cterm, ctermbg = t["magenta"].cterm },
  }
}
