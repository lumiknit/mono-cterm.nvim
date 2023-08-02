local function apply_theme()
  -- Initialize configurations
  if vim.version().minor < 7 then
    vim.notify_once("mono-cterm requires neovim>=0.7")
    return
  end
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end
  vim.g.colors_name = "mono-cterm"
  vim.o.termguicolors = false
  -- Set Palette
  local palette = require('mono-cterm').get_current_palette()
  local styles = {}
  local function ss(targets, style)
    table.insert(styles, {
      targets = targets,
      style = style,
    })
  end
  ss({ "Normal", "LineNr", "VertSplit", "WinSeparator", "SignColumn" }, {})
  ss({ "Bold", "SpecialKey" }, {
    bold = true,
  })
  ss({ "Italic" }, {
    fg = "brightblack",
    italic = true,
  })
  ss({ "BoldItalic", "Macro" }, {
    bold = true,
    italic = true,
  })
  ss({ "Underline", "Underlined" }, {
    underline = true,
  })
  ss({ "BoldUnderline", "MatchParen" }, {
    bold = true,
    underline = true,
  })
  ss({ "Black", "NonText" }, {
    fg = "black",
  })
  ss({ "BrightWhiteBold", "MoreMsg", "ModeMsg", "TooLong" }, {
    fg = "brightwhite",
    bold = true,
  })
  ss({ "Red", "Error", "ErrorMsg", "Question" }, {
    fg = "red",
  })
  ss({ "RedBold", "Error", "Exception" }, {
    fg = "red",
    bold = true,
  })
  ss({ "Yellow", "Debug" }, {
    fg = "yellow",
  })
  ss({ "YellowBold", "WarningMsg" }, {
    fg = "yellow",
    bold = true,
  })
  ss({ "Green", "Debug" }, {
    fg = "green",
  })
  ss({ "Cyan", "Directory" }, {
    fg = "cyan",
  })
  ss({ "Folded", "FoldColumn" }, {
    fg = "black",
    bg = "cyan",
    bold = true,
  })
  ss({ "Cursor" }, {
    fg = "black",
    bg = "red",
  })
  ss({ "CursorLine", "CursorColumn", "ColorColumn" }, {
    bg = "black",
  })
  ss({ "CursorLineNr" }, {
    bold = true,
  })
  ss({ "IncSearch" }, {
    fg = "black",
    bg = "yellow",
    bold = true,
  })
  ss({ "Search", "Substitute" }, {
    fg = "black",
    bg = "yellow",
  })
  ss({ "Visual", "VisualNOS" }, {
    reverse = true,
  })
  ss({ "Title" }, {
    bold = true,
  })
  ss({ "StatusLine" }, {
    bold = true,
    reverse = true,
  })
  ss({ "StatusLineNC" }, {
    reverse = true,
  })
  ss({ "PMenu" }, {
    fg = "white",
    bg = "brightblack",
  })
  ss({ "PMenuSel" }, {
    fg = "brightwhite",
    bg = "brightblack",
    bold = true,
    underline = true,
  })
  -- GitGutter
  ss({ "GitGutterAdd", "GitSignsAdd" }, {
    fg = "green",
    bold = true,
  })
  ss({ "GitGutterChange", "GitSignsChange" }, {
    fg = "yellow",
    bold = true,
  })
  ss({ "GitGutterDelete", "GitSignsDelete" }, {
    fg = "red",
    bold = true,
  })
  ss({ "GitGutterChangedelete", "GitSignsChangedelete" }, {
    fg = "magenta",
    bold = true,
  })
  -- Lang
  ss({
    "Delimiter", "Operator",
    "TSOperator", "TSPunctDelimiter", "TSPunctBracket",
    "TSPunctSpecial", "TSKeywordOperator",
    "TSTagDelimiter",
    "@punctuation.delimiter", "@punctuation.delimiter.markdown",
    "@punctuation.bracket", "@punctuation.special",
  }, {
    fg = "white",
  })
  ss({
    "Boolean", "Character", "Float", "Number",
    "TSNumber", "TSFloat",
    "@number", "@boolean", "@float", "@int", "@char",
  }, {
    fg = "magenta"
  })
  ss({
    "Constant", "Special", "TSConstant", "@constant",
  }, {
    fg = "white",
    italic = true,
  })
  ss({
    "String", "StringDelimiter",
    "TSString",
    "@string",
  }, {
    fg = "yellow",
  })
  ss({ "SpecialChar" }, {
    fg = "brightyellow",
    bold = true,
  })
  ss({
    "Function",
    "TSFunction", "TSMethod",
    "@function", "@method"
  }, {
    fg = "brightwhite",
    italic = true,
  })
  ss({ "Comment", "TSComment", "@comment" }, {
    fg = "brightblack",
    italic = true,
  })
  ss({
    "Identifier",
    "TSParameter", "TSParameterReference", "TSProperty", "TSField",
    "TSVariable", "TSVariableBuiltin", "TSTagCustom", "TSTagAttribute",
    "@parameter", "@parameter.reference", "@property", "@field",
    "@identifier", "@variable", "@variable.builtin", "@tag.custom", "@tag.attribute",
  }, {
    italic = true,
  })
  ss({
    "Conditional", "Define", "Include", "Keyword",
    "Label", "PreProc", "Repeat", "Statement",
    "TSConditional", "TSRepeat", "TSKeyword", "TSKeywordFunction",
    "TSKeywordReturn", "TSInclude", "TSStatement", "TSException",
    "@conditional", "@repeat", "@keyword", "@keyword.function", "@keyword.return",
    "@label", "@preproc", "@exception",
    "@statement", 
  }, {
    fg = "brightwhite",
    bold = true,
  })
  ss({
    "StorageClass", "Structure", "Tag", "Type",
    "TSType", "TSTypeBuiltin", "TSTag",
    "@type", "@type.builtin", "@tag",
  }, {
    bold = true,
    italic = true,
  })
  ss({
    "Namespace", "TSNamespace", "@namespace",
  }, {
    fg = "white",
    bold = true,
  })
  ss({
    "TSError",
    "@error",
  }, {
    fg = "red",
    bold = true,
  })
  for _, style in pairs(styles) do
    local opts = {}
    local s = style.style
    if s.fg ~= nil then
      opts.ctermfg = palette[s.fg].cterm
    end
    if s.bg ~= nil then
      opts.ctermbg = palette[s.bg].cterm
    end
    if s.bold ~= nil then
      opts.bold = true
    end
    if s.italic ~= nil then
      opts.italic = true
    end
    if s.underline ~= nil then
      opts.underline = true
    end
    if s.reverse ~= nil then
      opts.reverse = true
    end
    if s.link ~= nil then
      opts.link = s.link
    end
    for _, tgt in pairs(style.targets) do
      vim.api.nvim_set_hl(0, tgt, opts)
    end
  end
end

apply_theme()
