-- Vaporwave Colorscheme for Neovim
-- A E S T H E T I C pastel dreams

local M = {}

-- Color palette
local colors = {
  bg = '#190033',
  bg_light = '#2a004d',
  bg_lighter = '#4a0066',
  fg = '#ffffff',

  -- Pastel vaporwave colors
  pink = '#ff71ce',
  pink_bright = '#ff8dd7',
  cyan = '#01cdfe',
  cyan_bright = '#33ddff',
  purple = '#b967ff',
  purple_bright = '#cc88ff',
  teal = '#73fdff',
  teal_bright = '#8dffff',
  peach = '#ffb3ba',
  peach_bright = '#ffccdd',
  mint = '#05ffa1',
  mint_bright = '#33ffbb',
  magenta = '#ff6ec7',
  lavender = '#e6d5ff',

  -- Grays
  gray1 = '#3a0055',
  gray2 = '#5a0077',
  gray3 = '#aa88bb',

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
  vim.g.colors_name = 'vaporwave'

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
  highlight('Search', { fg = colors.bg, bg = colors.peach })
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
  highlight('MoreMsg', { fg = colors.mint })
  highlight('WarningMsg', { fg = colors.peach })
  highlight('ErrorMsg', { fg = colors.magenta, bold = true })
  highlight('Question', { fg = colors.cyan })

  -- Visual
  highlight('Visual', { bg = colors.bg_lighter })
  highlight('VisualNOS', { bg = colors.bg_lighter })

  -- Diff
  highlight('DiffAdd', { fg = colors.mint, bg = colors.bg_light })
  highlight('DiffChange', { fg = colors.peach, bg = colors.bg_light })
  highlight('DiffDelete', { fg = colors.magenta, bg = colors.bg_light })
  highlight('DiffText', { fg = colors.cyan, bg = colors.bg_light, bold = true })

  -- Spelling
  highlight('SpellBad', { undercurl = true, sp = colors.magenta })
  highlight('SpellCap', { undercurl = true, sp = colors.peach })
  highlight('SpellLocal', { undercurl = true, sp = colors.cyan })
  highlight('SpellRare', { undercurl = true, sp = colors.purple })

  -- Syntax highlighting
  highlight('Comment', { fg = colors.gray2, italic = true })
  highlight('Constant', { fg = colors.purple })
  highlight('String', { fg = colors.mint })
  highlight('Character', { fg = colors.mint_bright })
  highlight('Number', { fg = colors.purple_bright })
  highlight('Boolean', { fg = colors.purple })
  highlight('Float', { fg = colors.purple_bright })

  highlight('Identifier', { fg = colors.lavender })
  highlight('Function', { fg = colors.cyan, bold = true })

  highlight('Statement', { fg = colors.pink })
  highlight('Conditional', { fg = colors.pink })
  highlight('Repeat', { fg = colors.pink })
  highlight('Label', { fg = colors.pink_bright })
  highlight('Operator', { fg = colors.teal })
  highlight('Keyword', { fg = colors.pink, bold = true })
  highlight('Exception', { fg = colors.magenta })

  highlight('PreProc', { fg = colors.purple })
  highlight('Include', { fg = colors.purple })
  highlight('Define', { fg = colors.purple })
  highlight('Macro', { fg = colors.purple_bright })
  highlight('PreCondit', { fg = colors.purple })

  highlight('Type', { fg = colors.cyan })
  highlight('StorageClass', { fg = colors.cyan_bright })
  highlight('Structure', { fg = colors.cyan })
  highlight('Typedef', { fg = colors.cyan_bright })

  highlight('Special', { fg = colors.peach })
  highlight('SpecialChar', { fg = colors.peach_bright })
  highlight('Tag', { fg = colors.pink })
  highlight('Delimiter', { fg = colors.lavender })
  highlight('SpecialComment', { fg = colors.gray3 })
  highlight('Debug', { fg = colors.magenta })

  highlight('Underlined', { underline = true })
  highlight('Ignore', { fg = colors.gray1 })
  highlight('Error', { fg = colors.magenta, bold = true })
  highlight('Todo', { fg = colors.bg, bg = colors.pink, bold = true })

  -- Treesitter
  highlight('@variable', { fg = colors.lavender })
  highlight('@variable.builtin', { fg = colors.purple })
  highlight('@variable.parameter', { fg = colors.purple_bright })
  highlight('@variable.member', { fg = colors.lavender })
  highlight('@constant', { fg = colors.purple })
  highlight('@constant.builtin', { fg = colors.purple_bright })
  highlight('@module', { fg = colors.cyan })
  highlight('@label', { fg = colors.pink_bright })
  highlight('@string', { fg = colors.mint })
  highlight('@string.escape', { fg = colors.peach })
  highlight('@string.regexp', { fg = colors.teal })
  highlight('@character', { fg = colors.mint_bright })
  highlight('@number', { fg = colors.purple_bright })
  highlight('@boolean', { fg = colors.purple })
  highlight('@float', { fg = colors.purple_bright })
  highlight('@function', { fg = colors.cyan, bold = true })
  highlight('@function.builtin', { fg = colors.cyan })
  highlight('@function.call', { fg = colors.cyan })
  highlight('@function.method', { fg = colors.cyan })
  highlight('@constructor', { fg = colors.cyan_bright })
  highlight('@keyword', { fg = colors.pink, bold = true })
  highlight('@keyword.function', { fg = colors.pink })
  highlight('@keyword.operator', { fg = colors.pink })
  highlight('@keyword.return', { fg = colors.magenta })
  highlight('@operator', { fg = colors.teal })
  highlight('@punctuation', { fg = colors.gray3 })
  highlight('@punctuation.bracket', { fg = colors.teal_bright })
  highlight('@punctuation.delimiter', { fg = colors.gray3 })
  highlight('@type', { fg = colors.cyan })
  highlight('@type.builtin', { fg = colors.cyan_bright })
  highlight('@attribute', { fg = colors.purple })
  highlight('@property', { fg = colors.lavender })
  highlight('@comment', { fg = colors.gray2, italic = true })
  highlight('@tag', { fg = colors.pink })
  highlight('@tag.attribute', { fg = colors.cyan })
  highlight('@tag.delimiter', { fg = colors.gray3 })

  -- LSP
  highlight('DiagnosticError', { fg = colors.magenta })
  highlight('DiagnosticWarn', { fg = colors.peach })
  highlight('DiagnosticInfo', { fg = colors.cyan })
  highlight('DiagnosticHint', { fg = colors.purple_bright })
  highlight('DiagnosticUnderlineError', { undercurl = true, sp = colors.magenta })
  highlight('DiagnosticUnderlineWarn', { undercurl = true, sp = colors.peach })
  highlight('DiagnosticUnderlineInfo', { undercurl = true, sp = colors.cyan })
  highlight('DiagnosticUnderlineHint', { undercurl = true, sp = colors.purple })
  highlight('LspReferenceText', { bg = colors.bg_lighter })
  highlight('LspReferenceRead', { bg = colors.bg_lighter })
  highlight('LspReferenceWrite', { bg = colors.bg_lighter })

  -- Git signs
  highlight('GitSignsAdd', { fg = colors.mint })
  highlight('GitSignsChange', { fg = colors.peach })
  highlight('GitSignsDelete', { fg = colors.magenta })

  -- Telescope
  highlight('TelescopeBorder', { fg = colors.pink })
  highlight('TelescopePromptBorder', { fg = colors.pink })
  highlight('TelescopeResultsBorder', { fg = colors.pink })
  highlight('TelescopePreviewBorder', { fg = colors.pink })
  highlight('TelescopeSelection', { fg = colors.pink, bg = colors.bg_light })
  highlight('TelescopeMatching', { fg = colors.cyan, bold = true })

  -- NvimTree
  highlight('NvimTreeNormal', { fg = colors.fg, bg = colors.bg })
  highlight('NvimTreeFolderIcon', { fg = colors.pink })
  highlight('NvimTreeFolderName', { fg = colors.cyan })
  highlight('NvimTreeOpenedFolderName', { fg = colors.pink })
  highlight('NvimTreeRootFolder', { fg = colors.purple, bold = true })

  -- Which-key
  highlight('WhichKey', { fg = colors.pink })
  highlight('WhichKeyGroup', { fg = colors.cyan })
  highlight('WhichKeyDesc', { fg = colors.fg })
  highlight('WhichKeySeparator', { fg = colors.gray2 })

  -- Indent blankline
  highlight('IndentBlanklineChar', { fg = colors.gray1 })
  highlight('IndentBlanklineContextChar', { fg = colors.pink })
end

M.setup()

return M
