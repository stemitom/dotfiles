-- Miami Vice Colorscheme for Neovim
-- Hot pink and turquoise neon tropics

local M = {}

-- Color palette
local colors = {
  bg = '#0a0a14',
  bg_light = '#1a1a24',
  bg_lighter = '#3a3a44',
  fg = '#ffffff',

  -- Signature Miami Vice colors
  pink = '#ff0080',
  pink_bright = '#ff3399',
  coral = '#ff6bd9',
  turquoise = '#00ffcc',
  turquoise_bright = '#33ffdd',
  cyan = '#33ffcc',
  blue = '#0099ff',
  blue_bright = '#33aaff',
  purple = '#c724b1',
  green = '#00ffaa',
  yellow = '#ffcc00',
  yellow_bright = '#ffdd33',
  red = '#ff0066',
  lavender = '#e6e6ff',

  -- Grays
  gray1 = '#2a2a34',
  gray2 = '#4a4a54',
  gray3 = '#aaaacc',

  none = 'NONE',
}

local function highlight(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

function M.setup()
  vim.cmd 'hi clear'
  if vim.fn.exists 'syntax_on' then
    vim.cmd 'syntax reset'
  end
  vim.o.termguicolors = true
  vim.g.colors_name = 'miami-vice'

  -- Editor
  highlight('Normal', { fg = colors.fg, bg = colors.bg })
  highlight('NormalFloat', { fg = colors.fg, bg = colors.bg_light })
  highlight('Cursor', { fg = colors.bg, bg = colors.pink })
  highlight('CursorLine', { bg = colors.bg_light })
  highlight('CursorColumn', { bg = colors.bg_light })
  highlight('ColorColumn', { bg = colors.bg_light })
  highlight('LineNr', { fg = colors.gray2, bg = colors.bg })
  highlight('CursorLineNr', { fg = colors.pink, bg = colors.bg_light, bold = true })
  highlight('SignColumn', { fg = colors.fg, bg = colors.bg })
  highlight('VertSplit', { fg = colors.pink, bg = colors.bg })
  highlight('WinSeparator', { fg = colors.pink, bg = colors.bg })
  highlight('Folded', { fg = colors.gray3, bg = colors.bg_light })
  highlight('FoldColumn', { fg = colors.gray2, bg = colors.bg })
  highlight('NonText', { fg = colors.gray1 })
  highlight('SpecialKey', { fg = colors.gray1 })
  highlight('EndOfBuffer', { fg = colors.bg })

  -- Search
  highlight('Search', { fg = colors.bg, bg = colors.yellow })
  highlight('IncSearch', { fg = colors.bg, bg = colors.pink })
  highlight('CurSearch', { fg = colors.bg, bg = colors.pink })

  -- Popup menu
  highlight('Pmenu', { fg = colors.fg, bg = colors.bg_light })
  highlight('PmenuSel', { fg = colors.bg, bg = colors.pink })
  highlight('PmenuSbar', { bg = colors.bg_lighter })
  highlight('PmenuThumb', { bg = colors.pink })

  -- Status line
  highlight('StatusLine', { fg = colors.pink, bg = colors.bg_light })
  highlight('StatusLineNC', { fg = colors.gray2, bg = colors.bg_light })
  highlight('WildMenu', { fg = colors.bg, bg = colors.pink })

  -- Tab line
  highlight('TabLine', { fg = colors.gray3, bg = colors.bg_light })
  highlight('TabLineSel', { fg = colors.pink, bg = colors.bg, bold = true })
  highlight('TabLineFill', { bg = colors.bg_light })

  -- Messages
  highlight('ModeMsg', { fg = colors.pink, bold = true })
  highlight('MoreMsg', { fg = colors.turquoise })
  highlight('WarningMsg', { fg = colors.yellow })
  highlight('ErrorMsg', { fg = colors.red, bold = true })
  highlight('Question', { fg = colors.turquoise })

  -- Visual
  highlight('Visual', { bg = colors.bg_lighter })
  highlight('VisualNOS', { bg = colors.bg_lighter })

  -- Diff
  highlight('DiffAdd', { fg = colors.turquoise, bg = colors.bg_light })
  highlight('DiffChange', { fg = colors.yellow, bg = colors.bg_light })
  highlight('DiffDelete', { fg = colors.red, bg = colors.bg_light })
  highlight('DiffText', { fg = colors.pink, bg = colors.bg_light, bold = true })

  -- Spelling
  highlight('SpellBad', { undercurl = true, sp = colors.red })
  highlight('SpellCap', { undercurl = true, sp = colors.yellow })
  highlight('SpellLocal', { undercurl = true, sp = colors.turquoise })
  highlight('SpellRare', { undercurl = true, sp = colors.purple })

  -- Syntax highlighting
  highlight('Comment', { fg = colors.gray2, italic = true })
  highlight('Constant', { fg = colors.purple })
  highlight('String', { fg = colors.turquoise })
  highlight('Character', { fg = colors.turquoise_bright })
  highlight('Number', { fg = colors.coral })
  highlight('Boolean', { fg = colors.purple })
  highlight('Float', { fg = colors.coral })

  highlight('Identifier', { fg = colors.lavender })
  highlight('Function', { fg = colors.pink, bold = true })

  highlight('Statement', { fg = colors.pink })
  highlight('Conditional', { fg = colors.pink })
  highlight('Repeat', { fg = colors.pink })
  highlight('Label', { fg = colors.pink_bright })
  highlight('Operator', { fg = colors.turquoise })
  highlight('Keyword', { fg = colors.pink, bold = true })
  highlight('Exception', { fg = colors.red })

  highlight('PreProc', { fg = colors.purple })
  highlight('Include', { fg = colors.purple })
  highlight('Define', { fg = colors.purple })
  highlight('Macro', { fg = colors.coral })
  highlight('PreCondit', { fg = colors.purple })

  highlight('Type', { fg = colors.blue })
  highlight('StorageClass', { fg = colors.blue_bright })
  highlight('Structure', { fg = colors.blue })
  highlight('Typedef', { fg = colors.blue_bright })

  highlight('Special', { fg = colors.cyan })
  highlight('SpecialChar', { fg = colors.turquoise_bright })
  highlight('Tag', { fg = colors.pink })
  highlight('Delimiter', { fg = colors.lavender })
  highlight('SpecialComment', { fg = colors.gray3 })
  highlight('Debug', { fg = colors.red })

  highlight('Underlined', { underline = true })
  highlight('Ignore', { fg = colors.gray1 })
  highlight('Error', { fg = colors.red, bold = true })
  highlight('Todo', { fg = colors.bg, bg = colors.pink, bold = true })

  -- Treesitter
  highlight('@variable', { fg = colors.lavender })
  highlight('@variable.builtin', { fg = colors.purple })
  highlight('@variable.parameter', { fg = colors.coral })
  highlight('@variable.member', { fg = colors.lavender })
  highlight('@constant', { fg = colors.purple })
  highlight('@constant.builtin', { fg = colors.coral })
  highlight('@module', { fg = colors.blue })
  highlight('@label', { fg = colors.pink_bright })
  highlight('@string', { fg = colors.turquoise })
  highlight('@string.escape', { fg = colors.cyan })
  highlight('@string.regexp', { fg = colors.turquoise_bright })
  highlight('@character', { fg = colors.turquoise_bright })
  highlight('@number', { fg = colors.coral })
  highlight('@boolean', { fg = colors.purple })
  highlight('@float', { fg = colors.coral })
  highlight('@function', { fg = colors.pink, bold = true })
  highlight('@function.builtin', { fg = colors.pink })
  highlight('@function.call', { fg = colors.pink })
  highlight('@function.method', { fg = colors.pink })
  highlight('@constructor', { fg = colors.blue_bright })
  highlight('@keyword', { fg = colors.pink, bold = true })
  highlight('@keyword.function', { fg = colors.pink })
  highlight('@keyword.operator', { fg = colors.pink })
  highlight('@keyword.return', { fg = colors.red })
  highlight('@operator', { fg = colors.turquoise })
  highlight('@punctuation', { fg = colors.gray3 })
  highlight('@punctuation.bracket', { fg = colors.cyan })
  highlight('@punctuation.delimiter', { fg = colors.gray3 })
  highlight('@type', { fg = colors.blue })
  highlight('@type.builtin', { fg = colors.blue_bright })
  highlight('@attribute', { fg = colors.purple })
  highlight('@property', { fg = colors.lavender })
  highlight('@comment', { fg = colors.gray2, italic = true })
  highlight('@tag', { fg = colors.pink })
  highlight('@tag.attribute', { fg = colors.turquoise })
  highlight('@tag.delimiter', { fg = colors.gray3 })

  -- LSP
  highlight('DiagnosticError', { fg = colors.red })
  highlight('DiagnosticWarn', { fg = colors.yellow })
  highlight('DiagnosticInfo', { fg = colors.turquoise })
  highlight('DiagnosticHint', { fg = colors.blue_bright })
  highlight('DiagnosticUnderlineError', { undercurl = true, sp = colors.red })
  highlight('DiagnosticUnderlineWarn', { undercurl = true, sp = colors.yellow })
  highlight('DiagnosticUnderlineInfo', { undercurl = true, sp = colors.turquoise })
  highlight('DiagnosticUnderlineHint', { undercurl = true, sp = colors.blue })
  highlight('LspReferenceText', { bg = colors.bg_lighter })
  highlight('LspReferenceRead', { bg = colors.bg_lighter })
  highlight('LspReferenceWrite', { bg = colors.bg_lighter })

  -- Git signs
  highlight('GitSignsAdd', { fg = colors.turquoise })
  highlight('GitSignsChange', { fg = colors.yellow })
  highlight('GitSignsDelete', { fg = colors.red })

  -- Telescope
  highlight('TelescopeBorder', { fg = colors.pink })
  highlight('TelescopePromptBorder', { fg = colors.pink })
  highlight('TelescopeResultsBorder', { fg = colors.pink })
  highlight('TelescopePreviewBorder', { fg = colors.pink })
  highlight('TelescopeSelection', { fg = colors.pink, bg = colors.bg_light })
  highlight('TelescopeMatching', { fg = colors.turquoise, bold = true })

  -- NvimTree
  highlight('NvimTreeNormal', { fg = colors.fg, bg = colors.bg })
  highlight('NvimTreeFolderIcon', { fg = colors.pink })
  highlight('NvimTreeFolderName', { fg = colors.turquoise })
  highlight('NvimTreeOpenedFolderName', { fg = colors.pink })
  highlight('NvimTreeRootFolder', { fg = colors.purple, bold = true })

  -- Which-key
  highlight('WhichKey', { fg = colors.pink })
  highlight('WhichKeyGroup', { fg = colors.turquoise })
  highlight('WhichKeyDesc', { fg = colors.fg })
  highlight('WhichKeySeparator', { fg = colors.gray2 })

  -- Indent blankline
  highlight('IndentBlanklineChar', { fg = colors.gray1 })
  highlight('IndentBlanklineContextChar', { fg = colors.pink })
end

M.setup()

return M
