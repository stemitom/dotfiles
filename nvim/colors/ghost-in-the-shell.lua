-- Ghost in the Shell Colorscheme for Neovim
-- Cyber teal aesthetic for digital consciousness

local M = {}

-- Color palette
local colors = {
  bg = '#0e1419',
  bg_light = '#1a1f24',
  bg_lighter = '#2a3439',
  fg = '#c5d4dd',

  -- Signature cyber colors
  cyan = '#00d9ff',
  cyan_bright = '#33eeff',
  purple = '#b366ff',
  purple_bright = '#cc88ff',
  pink = '#ff1493',
  green = '#00ff9f',
  green_bright = '#33ffaa',
  yellow = '#ffd966',
  yellow_bright = '#ffe680',
  blue = '#00aaff',
  blue_bright = '#33bbff',
  red = '#ff4757',
  red_bright = '#ff6b81',

  -- Grays
  gray1 = '#2a3439',
  gray2 = '#3a4a54',
  gray3 = '#8a9aa4',

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
  vim.g.colors_name = 'ghost-in-the-shell'

  -- Editor
  highlight('Normal', { fg = colors.fg, bg = colors.bg })
  highlight('NormalFloat', { fg = colors.fg, bg = colors.bg_light })
  highlight('Cursor', { fg = colors.bg, bg = colors.cyan })
  highlight('CursorLine', { bg = colors.bg_light })
  highlight('CursorColumn', { bg = colors.bg_light })
  highlight('ColorColumn', { bg = colors.bg_light })
  highlight('LineNr', { fg = colors.gray2, bg = colors.bg })
  highlight('CursorLineNr', { fg = colors.cyan, bg = colors.bg_light, bold = true })
  highlight('SignColumn', { fg = colors.fg, bg = colors.bg })
  highlight('VertSplit', { fg = colors.cyan, bg = colors.bg })
  highlight('WinSeparator', { fg = colors.cyan, bg = colors.bg })
  highlight('Folded', { fg = colors.gray3, bg = colors.bg_light })
  highlight('FoldColumn', { fg = colors.gray2, bg = colors.bg })
  highlight('NonText', { fg = colors.gray1 })
  highlight('SpecialKey', { fg = colors.gray1 })
  highlight('EndOfBuffer', { fg = colors.bg })

  -- Search
  highlight('Search', { fg = colors.bg, bg = colors.yellow })
  highlight('IncSearch', { fg = colors.bg, bg = colors.cyan })
  highlight('CurSearch', { fg = colors.bg, bg = colors.cyan })

  -- Popup menu
  highlight('Pmenu', { fg = colors.fg, bg = colors.bg_light })
  highlight('PmenuSel', { fg = colors.bg, bg = colors.cyan })
  highlight('PmenuSbar', { bg = colors.bg_lighter })
  highlight('PmenuThumb', { bg = colors.cyan })

  -- Status line
  highlight('StatusLine', { fg = colors.cyan, bg = colors.bg_light })
  highlight('StatusLineNC', { fg = colors.gray2, bg = colors.bg_light })
  highlight('WildMenu', { fg = colors.bg, bg = colors.cyan })

  -- Tab line
  highlight('TabLine', { fg = colors.gray3, bg = colors.bg_light })
  highlight('TabLineSel', { fg = colors.cyan, bg = colors.bg, bold = true })
  highlight('TabLineFill', { bg = colors.bg_light })

  -- Messages
  highlight('ModeMsg', { fg = colors.cyan, bold = true })
  highlight('MoreMsg', { fg = colors.green })
  highlight('WarningMsg', { fg = colors.yellow })
  highlight('ErrorMsg', { fg = colors.red_bright, bold = true })
  highlight('Question', { fg = colors.purple })

  -- Visual
  highlight('Visual', { bg = colors.bg_lighter })
  highlight('VisualNOS', { bg = colors.bg_lighter })

  -- Diff
  highlight('DiffAdd', { fg = colors.green, bg = colors.bg_light })
  highlight('DiffChange', { fg = colors.yellow, bg = colors.bg_light })
  highlight('DiffDelete', { fg = colors.red, bg = colors.bg_light })
  highlight('DiffText', { fg = colors.cyan, bg = colors.bg_light, bold = true })

  -- Spelling
  highlight('SpellBad', { undercurl = true, sp = colors.red })
  highlight('SpellCap', { undercurl = true, sp = colors.yellow })
  highlight('SpellLocal', { undercurl = true, sp = colors.cyan })
  highlight('SpellRare', { undercurl = true, sp = colors.purple })

  -- Syntax highlighting
  highlight('Comment', { fg = colors.gray2, italic = true })
  highlight('Constant', { fg = colors.purple })
  highlight('String', { fg = colors.green })
  highlight('Character', { fg = colors.green_bright })
  highlight('Number', { fg = colors.purple_bright })
  highlight('Boolean', { fg = colors.purple })
  highlight('Float', { fg = colors.purple_bright })

  highlight('Identifier', { fg = colors.fg })
  highlight('Function', { fg = colors.cyan, bold = true })

  highlight('Statement', { fg = colors.pink })
  highlight('Conditional', { fg = colors.pink })
  highlight('Repeat', { fg = colors.pink })
  highlight('Label', { fg = colors.cyan })
  highlight('Operator', { fg = colors.cyan_bright })
  highlight('Keyword', { fg = colors.pink, bold = true })
  highlight('Exception', { fg = colors.red_bright })

  highlight('PreProc', { fg = colors.purple })
  highlight('Include', { fg = colors.purple })
  highlight('Define', { fg = colors.purple })
  highlight('Macro', { fg = colors.purple_bright })
  highlight('PreCondit', { fg = colors.purple })

  highlight('Type', { fg = colors.blue })
  highlight('StorageClass', { fg = colors.blue })
  highlight('Structure', { fg = colors.blue_bright })
  highlight('Typedef', { fg = colors.blue })

  highlight('Special', { fg = colors.cyan_bright })
  highlight('SpecialChar', { fg = colors.green_bright })
  highlight('Tag', { fg = colors.cyan })
  highlight('Delimiter', { fg = colors.fg })
  highlight('SpecialComment', { fg = colors.gray3 })
  highlight('Debug', { fg = colors.red })

  highlight('Underlined', { underline = true })
  highlight('Ignore', { fg = colors.gray1 })
  highlight('Error', { fg = colors.red_bright, bold = true })
  highlight('Todo', { fg = colors.bg, bg = colors.cyan, bold = true })

  -- Treesitter
  highlight('@variable', { fg = colors.fg })
  highlight('@variable.builtin', { fg = colors.purple })
  highlight('@variable.parameter', { fg = colors.purple_bright })
  highlight('@variable.member', { fg = colors.fg })
  highlight('@constant', { fg = colors.purple })
  highlight('@constant.builtin', { fg = colors.purple_bright })
  highlight('@module', { fg = colors.blue })
  highlight('@label', { fg = colors.cyan })
  highlight('@string', { fg = colors.green })
  highlight('@string.escape', { fg = colors.green_bright })
  highlight('@string.regexp', { fg = colors.cyan })
  highlight('@character', { fg = colors.green_bright })
  highlight('@number', { fg = colors.purple_bright })
  highlight('@boolean', { fg = colors.purple })
  highlight('@float', { fg = colors.purple_bright })
  highlight('@function', { fg = colors.cyan, bold = true })
  highlight('@function.builtin', { fg = colors.cyan })
  highlight('@function.call', { fg = colors.cyan })
  highlight('@function.method', { fg = colors.cyan })
  highlight('@constructor', { fg = colors.blue_bright })
  highlight('@keyword', { fg = colors.pink, bold = true })
  highlight('@keyword.function', { fg = colors.pink })
  highlight('@keyword.operator', { fg = colors.pink })
  highlight('@keyword.return', { fg = colors.red_bright })
  highlight('@operator', { fg = colors.cyan_bright })
  highlight('@punctuation', { fg = colors.gray3 })
  highlight('@punctuation.bracket', { fg = colors.cyan_bright })
  highlight('@punctuation.delimiter', { fg = colors.gray3 })
  highlight('@type', { fg = colors.blue })
  highlight('@type.builtin', { fg = colors.blue_bright })
  highlight('@attribute', { fg = colors.purple })
  highlight('@property', { fg = colors.fg })
  highlight('@comment', { fg = colors.gray2, italic = true })
  highlight('@tag', { fg = colors.pink })
  highlight('@tag.attribute', { fg = colors.cyan })
  highlight('@tag.delimiter', { fg = colors.gray3 })

  -- LSP
  highlight('DiagnosticError', { fg = colors.red_bright })
  highlight('DiagnosticWarn', { fg = colors.yellow })
  highlight('DiagnosticInfo', { fg = colors.cyan })
  highlight('DiagnosticHint', { fg = colors.blue_bright })
  highlight('DiagnosticUnderlineError', { undercurl = true, sp = colors.red })
  highlight('DiagnosticUnderlineWarn', { undercurl = true, sp = colors.yellow })
  highlight('DiagnosticUnderlineInfo', { undercurl = true, sp = colors.cyan })
  highlight('DiagnosticUnderlineHint', { undercurl = true, sp = colors.blue })
  highlight('LspReferenceText', { bg = colors.bg_lighter })
  highlight('LspReferenceRead', { bg = colors.bg_lighter })
  highlight('LspReferenceWrite', { bg = colors.bg_lighter })

  -- Git signs
  highlight('GitSignsAdd', { fg = colors.green })
  highlight('GitSignsChange', { fg = colors.yellow })
  highlight('GitSignsDelete', { fg = colors.red })

  -- Telescope
  highlight('TelescopeBorder', { fg = colors.cyan })
  highlight('TelescopePromptBorder', { fg = colors.cyan })
  highlight('TelescopeResultsBorder', { fg = colors.cyan })
  highlight('TelescopePreviewBorder', { fg = colors.cyan })
  highlight('TelescopeSelection', { fg = colors.cyan, bg = colors.bg_light })
  highlight('TelescopeMatching', { fg = colors.purple, bold = true })

  -- NvimTree
  highlight('NvimTreeNormal', { fg = colors.fg, bg = colors.bg })
  highlight('NvimTreeFolderIcon', { fg = colors.cyan })
  highlight('NvimTreeFolderName', { fg = colors.blue })
  highlight('NvimTreeOpenedFolderName', { fg = colors.cyan })
  highlight('NvimTreeRootFolder', { fg = colors.pink, bold = true })

  -- Which-key
  highlight('WhichKey', { fg = colors.cyan })
  highlight('WhichKeyGroup', { fg = colors.purple })
  highlight('WhichKeyDesc', { fg = colors.fg })
  highlight('WhichKeySeparator', { fg = colors.gray2 })

  -- Indent blankline
  highlight('IndentBlanklineChar', { fg = colors.gray1 })
  highlight('IndentBlanklineContextChar', { fg = colors.cyan })
end

M.setup()

return M
