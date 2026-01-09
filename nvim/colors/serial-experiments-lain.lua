-- Serial Experiments Lain Colorscheme for Neovim
-- Digital static and pale phosphor aesthetic

local M = {}

-- Color palette
local colors = {
  bg = '#1a1a1a',
  bg_light = '#2a2a2a',
  bg_lighter = '#3a3a3a',
  fg = '#b3b3b3',

  -- Pale, washed out colors
  blue = '#66b3ff',
  blue_bright = '#99ccff',
  green = '#99ff99',
  green_bright = '#aaffaa',
  yellow = '#ffff99',
  yellow_bright = '#ffffaa',
  red = '#cc6666',
  red_bright = '#ff9999',
  purple = '#cc99cc',
  purple_bright = '#ddaadd',
  cyan = '#99cccc',
  cyan_bright = '#aadddd',

  -- Grays
  gray1 = '#3a3a3a',
  gray2 = '#4a4a4a',
  gray3 = '#8a8a8a',
  gray4 = '#e6e6e6',

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
  vim.g.colors_name = 'serial-experiments-lain'

  -- Editor
  highlight('Normal', { fg = colors.fg, bg = colors.bg })
  highlight('NormalFloat', { fg = colors.fg, bg = colors.bg_light })
  highlight('Cursor', { fg = colors.bg, bg = colors.blue })
  highlight('CursorLine', { bg = colors.bg_light })
  highlight('CursorColumn', { bg = colors.bg_light })
  highlight('ColorColumn', { bg = colors.bg_light })
  highlight('LineNr', { fg = colors.gray2, bg = colors.bg })
  highlight('CursorLineNr', { fg = colors.blue, bg = colors.bg_light, bold = true })
  highlight('SignColumn', { fg = colors.fg, bg = colors.bg })
  highlight('VertSplit', { fg = colors.gray2, bg = colors.bg })
  highlight('WinSeparator', { fg = colors.gray2, bg = colors.bg })
  highlight('Folded', { fg = colors.gray3, bg = colors.bg_light })
  highlight('FoldColumn', { fg = colors.gray2, bg = colors.bg })
  highlight('NonText', { fg = colors.gray1 })
  highlight('SpecialKey', { fg = colors.gray1 })
  highlight('EndOfBuffer', { fg = colors.bg })

  -- Search
  highlight('Search', { fg = colors.bg, bg = colors.yellow })
  highlight('IncSearch', { fg = colors.bg, bg = colors.blue })
  highlight('CurSearch', { fg = colors.bg, bg = colors.blue })

  -- Popup menu
  highlight('Pmenu', { fg = colors.fg, bg = colors.bg_light })
  highlight('PmenuSel', { fg = colors.bg, bg = colors.blue })
  highlight('PmenuSbar', { bg = colors.bg_lighter })
  highlight('PmenuThumb', { bg = colors.blue })

  -- Status line
  highlight('StatusLine', { fg = colors.blue, bg = colors.bg_light })
  highlight('StatusLineNC', { fg = colors.gray2, bg = colors.bg_light })
  highlight('WildMenu', { fg = colors.bg, bg = colors.blue })

  -- Tab line
  highlight('TabLine', { fg = colors.gray3, bg = colors.bg_light })
  highlight('TabLineSel', { fg = colors.blue, bg = colors.bg, bold = true })
  highlight('TabLineFill', { bg = colors.bg_light })

  -- Messages
  highlight('ModeMsg', { fg = colors.blue, bold = true })
  highlight('MoreMsg', { fg = colors.green })
  highlight('WarningMsg', { fg = colors.yellow })
  highlight('ErrorMsg', { fg = colors.red_bright, bold = true })
  highlight('Question', { fg = colors.cyan })

  -- Visual
  highlight('Visual', { bg = colors.bg_lighter })
  highlight('VisualNOS', { bg = colors.bg_lighter })

  -- Diff
  highlight('DiffAdd', { fg = colors.green, bg = colors.bg_light })
  highlight('DiffChange', { fg = colors.yellow, bg = colors.bg_light })
  highlight('DiffDelete', { fg = colors.red, bg = colors.bg_light })
  highlight('DiffText', { fg = colors.blue, bg = colors.bg_light, bold = true })

  -- Spelling
  highlight('SpellBad', { undercurl = true, sp = colors.red })
  highlight('SpellCap', { undercurl = true, sp = colors.yellow })
  highlight('SpellLocal', { undercurl = true, sp = colors.cyan })
  highlight('SpellRare', { undercurl = true, sp = colors.purple })

  -- Syntax highlighting
  highlight('Comment', { fg = colors.gray2, italic = true })
  highlight('Constant', { fg = colors.cyan })
  highlight('String', { fg = colors.green })
  highlight('Character', { fg = colors.green_bright })
  highlight('Number', { fg = colors.purple })
  highlight('Boolean', { fg = colors.purple_bright })
  highlight('Float', { fg = colors.purple })

  highlight('Identifier', { fg = colors.fg })
  highlight('Function', { fg = colors.blue, bold = true })

  highlight('Statement', { fg = colors.blue_bright })
  highlight('Conditional', { fg = colors.blue_bright })
  highlight('Repeat', { fg = colors.blue_bright })
  highlight('Label', { fg = colors.blue })
  highlight('Operator', { fg = colors.cyan })
  highlight('Keyword', { fg = colors.blue_bright, bold = true })
  highlight('Exception', { fg = colors.red_bright })

  highlight('PreProc', { fg = colors.purple })
  highlight('Include', { fg = colors.purple })
  highlight('Define', { fg = colors.purple })
  highlight('Macro', { fg = colors.purple_bright })
  highlight('PreCondit', { fg = colors.purple })

  highlight('Type', { fg = colors.cyan_bright })
  highlight('StorageClass', { fg = colors.cyan })
  highlight('Structure', { fg = colors.cyan_bright })
  highlight('Typedef', { fg = colors.cyan })

  highlight('Special', { fg = colors.yellow_bright })
  highlight('SpecialChar', { fg = colors.yellow })
  highlight('Tag', { fg = colors.blue })
  highlight('Delimiter', { fg = colors.gray3 })
  highlight('SpecialComment', { fg = colors.gray3 })
  highlight('Debug', { fg = colors.red })

  highlight('Underlined', { underline = true })
  highlight('Ignore', { fg = colors.gray1 })
  highlight('Error', { fg = colors.red_bright, bold = true })
  highlight('Todo', { fg = colors.bg, bg = colors.blue, bold = true })

  -- Treesitter
  highlight('@variable', { fg = colors.fg })
  highlight('@variable.builtin', { fg = colors.cyan })
  highlight('@variable.parameter', { fg = colors.purple_bright })
  highlight('@variable.member', { fg = colors.fg })
  highlight('@constant', { fg = colors.cyan })
  highlight('@constant.builtin', { fg = colors.cyan_bright })
  highlight('@module', { fg = colors.cyan_bright })
  highlight('@label', { fg = colors.blue })
  highlight('@string', { fg = colors.green })
  highlight('@string.escape', { fg = colors.yellow })
  highlight('@string.regexp', { fg = colors.cyan })
  highlight('@character', { fg = colors.green_bright })
  highlight('@number', { fg = colors.purple })
  highlight('@boolean', { fg = colors.purple_bright })
  highlight('@float', { fg = colors.purple })
  highlight('@function', { fg = colors.blue, bold = true })
  highlight('@function.builtin', { fg = colors.blue })
  highlight('@function.call', { fg = colors.blue })
  highlight('@function.method', { fg = colors.blue })
  highlight('@constructor', { fg = colors.cyan_bright })
  highlight('@keyword', { fg = colors.blue_bright, bold = true })
  highlight('@keyword.function', { fg = colors.blue_bright })
  highlight('@keyword.operator', { fg = colors.blue })
  highlight('@keyword.return', { fg = colors.red_bright })
  highlight('@operator', { fg = colors.cyan })
  highlight('@punctuation', { fg = colors.gray3 })
  highlight('@punctuation.bracket', { fg = colors.gray3 })
  highlight('@punctuation.delimiter', { fg = colors.gray3 })
  highlight('@type', { fg = colors.cyan_bright })
  highlight('@type.builtin', { fg = colors.cyan })
  highlight('@attribute', { fg = colors.purple })
  highlight('@property', { fg = colors.fg })
  highlight('@comment', { fg = colors.gray2, italic = true })
  highlight('@tag', { fg = colors.blue_bright })
  highlight('@tag.attribute', { fg = colors.blue })
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
  highlight('TelescopeBorder', { fg = colors.blue })
  highlight('TelescopePromptBorder', { fg = colors.blue })
  highlight('TelescopeResultsBorder', { fg = colors.blue })
  highlight('TelescopePreviewBorder', { fg = colors.blue })
  highlight('TelescopeSelection', { fg = colors.blue, bg = colors.bg_light })
  highlight('TelescopeMatching', { fg = colors.green, bold = true })

  -- NvimTree
  highlight('NvimTreeNormal', { fg = colors.fg, bg = colors.bg })
  highlight('NvimTreeFolderIcon', { fg = colors.blue })
  highlight('NvimTreeFolderName', { fg = colors.cyan })
  highlight('NvimTreeOpenedFolderName', { fg = colors.blue })
  highlight('NvimTreeRootFolder', { fg = colors.purple, bold = true })

  -- Which-key
  highlight('WhichKey', { fg = colors.blue })
  highlight('WhichKeyGroup', { fg = colors.cyan })
  highlight('WhichKeyDesc', { fg = colors.fg })
  highlight('WhichKeySeparator', { fg = colors.gray2 })

  -- Indent blankline
  highlight('IndentBlanklineChar', { fg = colors.gray1 })
  highlight('IndentBlanklineContextChar', { fg = colors.blue })
end

M.setup()

return M
