-- Cowboy Bebop Colorscheme for Neovim
-- Jazz noir aesthetic inspired by the legendary anime

local M = {}

-- Color palette
local colors = {
  bg = '#0d1117',
  bg_light = '#1a1a1a',
  bg_lighter = '#2a2a2a',
  fg = '#e8dcc4',

  -- Signature colors
  gold = '#d4af37',
  blue = '#2c5f8d',
  blue_bright = '#5a8fcc',
  orange = '#cc7a00',
  red = '#8b1a1a',
  red_bright = '#cc3333',
  green = '#5a7a3a',
  green_bright = '#7ab35a',
  cyan = '#4a6a7a',
  cyan_bright = '#6a9aba',
  purple = '#7a4a6a',
  purple_bright = '#aa6a9a',
  cream = '#b8a890',

  -- Grays
  gray1 = '#3a3a3a',
  gray2 = '#5a5a5a',
  gray3 = '#8a8a7a',

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
  vim.g.colors_name = 'cowboy-bebop'

  -- Editor
  highlight('Normal', { fg = colors.fg, bg = colors.bg })
  highlight('NormalFloat', { fg = colors.fg, bg = colors.bg_light })
  highlight('Cursor', { fg = colors.bg, bg = colors.gold })
  highlight('CursorLine', { bg = colors.bg_light })
  highlight('CursorColumn', { bg = colors.bg_light })
  highlight('ColorColumn', { bg = colors.bg_light })
  highlight('LineNr', { fg = colors.gray2, bg = colors.bg })
  highlight('CursorLineNr', { fg = colors.gold, bg = colors.bg_light, bold = true })
  highlight('SignColumn', { fg = colors.fg, bg = colors.bg })
  highlight('VertSplit', { fg = colors.gold, bg = colors.bg })
  highlight('WinSeparator', { fg = colors.gold, bg = colors.bg })
  highlight('Folded', { fg = colors.gray3, bg = colors.bg_light })
  highlight('FoldColumn', { fg = colors.gray2, bg = colors.bg })
  highlight('NonText', { fg = colors.gray1 })
  highlight('SpecialKey', { fg = colors.gray1 })
  highlight('EndOfBuffer', { fg = colors.bg })

  -- Search
  highlight('Search', { fg = colors.bg, bg = colors.orange })
  highlight('IncSearch', { fg = colors.bg, bg = colors.gold })
  highlight('CurSearch', { fg = colors.bg, bg = colors.gold })

  -- Popup menu
  highlight('Pmenu', { fg = colors.fg, bg = colors.bg_light })
  highlight('PmenuSel', { fg = colors.bg, bg = colors.gold })
  highlight('PmenuSbar', { bg = colors.bg_lighter })
  highlight('PmenuThumb', { bg = colors.gold })

  -- Status line
  highlight('StatusLine', { fg = colors.gold, bg = colors.bg_light })
  highlight('StatusLineNC', { fg = colors.gray2, bg = colors.bg_light })
  highlight('WildMenu', { fg = colors.bg, bg = colors.gold })

  -- Tab line
  highlight('TabLine', { fg = colors.gray3, bg = colors.bg_light })
  highlight('TabLineSel', { fg = colors.gold, bg = colors.bg, bold = true })
  highlight('TabLineFill', { bg = colors.bg_light })

  -- Messages
  highlight('ModeMsg', { fg = colors.gold, bold = true })
  highlight('MoreMsg', { fg = colors.green_bright })
  highlight('WarningMsg', { fg = colors.orange })
  highlight('ErrorMsg', { fg = colors.red_bright, bold = true })
  highlight('Question', { fg = colors.cyan_bright })

  -- Visual
  highlight('Visual', { bg = colors.bg_lighter })
  highlight('VisualNOS', { bg = colors.bg_lighter })

  -- Diff
  highlight('DiffAdd', { fg = colors.green_bright, bg = colors.bg_light })
  highlight('DiffChange', { fg = colors.orange, bg = colors.bg_light })
  highlight('DiffDelete', { fg = colors.red, bg = colors.bg_light })
  highlight('DiffText', { fg = colors.gold, bg = colors.bg_light, bold = true })

  -- Spelling
  highlight('SpellBad', { undercurl = true, sp = colors.red })
  highlight('SpellCap', { undercurl = true, sp = colors.orange })
  highlight('SpellLocal', { undercurl = true, sp = colors.cyan })
  highlight('SpellRare', { undercurl = true, sp = colors.purple })

  -- Syntax highlighting
  highlight('Comment', { fg = colors.gray2, italic = true })
  highlight('Constant', { fg = colors.cyan_bright })
  highlight('String', { fg = colors.green_bright })
  highlight('Character', { fg = colors.green })
  highlight('Number', { fg = colors.orange })
  highlight('Boolean', { fg = colors.orange })
  highlight('Float', { fg = colors.orange })

  highlight('Identifier', { fg = colors.cream })
  highlight('Function', { fg = colors.gold, bold = true })

  highlight('Statement', { fg = colors.blue_bright })
  highlight('Conditional', { fg = colors.blue_bright })
  highlight('Repeat', { fg = colors.blue_bright })
  highlight('Label', { fg = colors.gold })
  highlight('Operator', { fg = colors.fg })
  highlight('Keyword', { fg = colors.blue_bright, bold = true })
  highlight('Exception', { fg = colors.red_bright })

  highlight('PreProc', { fg = colors.purple_bright })
  highlight('Include', { fg = colors.purple_bright })
  highlight('Define', { fg = colors.purple_bright })
  highlight('Macro', { fg = colors.purple_bright })
  highlight('PreCondit', { fg = colors.purple_bright })

  highlight('Type', { fg = colors.cyan_bright })
  highlight('StorageClass', { fg = colors.blue })
  highlight('Structure', { fg = colors.cyan_bright })
  highlight('Typedef', { fg = colors.cyan_bright })

  highlight('Special', { fg = colors.gold })
  highlight('SpecialChar', { fg = colors.orange })
  highlight('Tag', { fg = colors.gold })
  highlight('Delimiter', { fg = colors.cream })
  highlight('SpecialComment', { fg = colors.gray3 })
  highlight('Debug', { fg = colors.red })

  highlight('Underlined', { underline = true })
  highlight('Ignore', { fg = colors.gray1 })
  highlight('Error', { fg = colors.red_bright, bold = true })
  highlight('Todo', { fg = colors.bg, bg = colors.gold, bold = true })

  -- Treesitter
  highlight('@variable', { fg = colors.fg })
  highlight('@variable.builtin', { fg = colors.cyan })
  highlight('@variable.parameter', { fg = colors.cream })
  highlight('@variable.member', { fg = colors.fg })
  highlight('@constant', { fg = colors.cyan_bright })
  highlight('@constant.builtin', { fg = colors.cyan_bright })
  highlight('@module', { fg = colors.cyan_bright })
  highlight('@label', { fg = colors.gold })
  highlight('@string', { fg = colors.green_bright })
  highlight('@string.escape', { fg = colors.orange })
  highlight('@string.regexp', { fg = colors.cyan })
  highlight('@character', { fg = colors.green })
  highlight('@number', { fg = colors.orange })
  highlight('@boolean', { fg = colors.orange })
  highlight('@float', { fg = colors.orange })
  highlight('@function', { fg = colors.gold, bold = true })
  highlight('@function.builtin', { fg = colors.gold })
  highlight('@function.call', { fg = colors.gold })
  highlight('@function.method', { fg = colors.gold })
  highlight('@constructor', { fg = colors.cyan_bright })
  highlight('@keyword', { fg = colors.blue_bright, bold = true })
  highlight('@keyword.function', { fg = colors.blue_bright })
  highlight('@keyword.operator', { fg = colors.blue })
  highlight('@keyword.return', { fg = colors.red_bright })
  highlight('@operator', { fg = colors.fg })
  highlight('@punctuation', { fg = colors.gray3 })
  highlight('@punctuation.bracket', { fg = colors.cream })
  highlight('@punctuation.delimiter', { fg = colors.gray3 })
  highlight('@type', { fg = colors.cyan_bright })
  highlight('@type.builtin', { fg = colors.cyan })
  highlight('@attribute', { fg = colors.purple_bright })
  highlight('@property', { fg = colors.cream })
  highlight('@comment', { fg = colors.gray2, italic = true })
  highlight('@tag', { fg = colors.blue_bright })
  highlight('@tag.attribute', { fg = colors.gold })
  highlight('@tag.delimiter', { fg = colors.gray3 })

  -- LSP
  highlight('DiagnosticError', { fg = colors.red_bright })
  highlight('DiagnosticWarn', { fg = colors.orange })
  highlight('DiagnosticInfo', { fg = colors.cyan_bright })
  highlight('DiagnosticHint', { fg = colors.blue_bright })
  highlight('DiagnosticUnderlineError', { undercurl = true, sp = colors.red })
  highlight('DiagnosticUnderlineWarn', { undercurl = true, sp = colors.orange })
  highlight('DiagnosticUnderlineInfo', { undercurl = true, sp = colors.cyan })
  highlight('DiagnosticUnderlineHint', { undercurl = true, sp = colors.blue })
  highlight('LspReferenceText', { bg = colors.bg_lighter })
  highlight('LspReferenceRead', { bg = colors.bg_lighter })
  highlight('LspReferenceWrite', { bg = colors.bg_lighter })

  -- Git signs
  highlight('GitSignsAdd', { fg = colors.green_bright })
  highlight('GitSignsChange', { fg = colors.orange })
  highlight('GitSignsDelete', { fg = colors.red })

  -- Telescope
  highlight('TelescopeBorder', { fg = colors.gold })
  highlight('TelescopePromptBorder', { fg = colors.gold })
  highlight('TelescopeResultsBorder', { fg = colors.gold })
  highlight('TelescopePreviewBorder', { fg = colors.gold })
  highlight('TelescopeSelection', { fg = colors.gold, bg = colors.bg_light })
  highlight('TelescopeMatching', { fg = colors.gold, bold = true })

  -- NvimTree
  highlight('NvimTreeNormal', { fg = colors.fg, bg = colors.bg })
  highlight('NvimTreeFolderIcon', { fg = colors.gold })
  highlight('NvimTreeFolderName', { fg = colors.cream })
  highlight('NvimTreeOpenedFolderName', { fg = colors.gold })
  highlight('NvimTreeRootFolder', { fg = colors.blue_bright, bold = true })

  -- Which-key
  highlight('WhichKey', { fg = colors.gold })
  highlight('WhichKeyGroup', { fg = colors.cyan_bright })
  highlight('WhichKeyDesc', { fg = colors.fg })
  highlight('WhichKeySeparator', { fg = colors.gray2 })

  -- Indent blankline
  highlight('IndentBlanklineChar', { fg = colors.gray1 })
  highlight('IndentBlanklineContextChar', { fg = colors.gold })
end

M.setup()

return M
