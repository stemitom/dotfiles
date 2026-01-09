-- Akira Colorscheme for Neovim
-- Neon dystopian cyberpunk aesthetic

local M = {}

-- Color palette
local colors = {
  bg = '#0a0a0a',
  bg_light = '#1a1a1a',
  bg_lighter = '#2a2a2a',
  fg = '#ffffff',

  -- Signature neon colors
  red = '#ff0033',
  red_bright = '#ff3366',
  blue = '#0099ff',
  blue_bright = '#33aaff',
  cyan = '#00ffff',
  cyan_bright = '#33ffff',
  green = '#00ff66',
  green_bright = '#33ff88',
  yellow = '#ffcc00',
  yellow_bright = '#ffdd33',
  magenta = '#ff00ff',
  magenta_bright = '#ff33ff',

  -- Grays
  gray1 = '#2a2a2a',
  gray2 = '#4a4a4a',
  gray3 = '#cccccc',

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
  vim.g.colors_name = 'akira'

  -- Editor
  highlight('Normal', { fg = colors.fg, bg = colors.bg })
  highlight('NormalFloat', { fg = colors.fg, bg = colors.bg_light })
  highlight('Cursor', { fg = colors.bg, bg = colors.red })
  highlight('CursorLine', { bg = colors.bg_light })
  highlight('CursorColumn', { bg = colors.bg_light })
  highlight('ColorColumn', { bg = colors.bg_light })
  highlight('LineNr', { fg = colors.gray2, bg = colors.bg })
  highlight('CursorLineNr', { fg = colors.red, bg = colors.bg_light, bold = true })
  highlight('SignColumn', { fg = colors.fg, bg = colors.bg })
  highlight('VertSplit', { fg = colors.red, bg = colors.bg })
  highlight('WinSeparator', { fg = colors.red, bg = colors.bg })
  highlight('Folded', { fg = colors.gray3, bg = colors.bg_light })
  highlight('FoldColumn', { fg = colors.gray2, bg = colors.bg })
  highlight('NonText', { fg = colors.gray1 })
  highlight('SpecialKey', { fg = colors.gray1 })
  highlight('EndOfBuffer', { fg = colors.bg })

  -- Search
  highlight('Search', { fg = colors.bg, bg = colors.yellow })
  highlight('IncSearch', { fg = colors.bg, bg = colors.red })
  highlight('CurSearch', { fg = colors.bg, bg = colors.red })

  -- Popup menu
  highlight('Pmenu', { fg = colors.fg, bg = colors.bg_light })
  highlight('PmenuSel', { fg = colors.bg, bg = colors.red })
  highlight('PmenuSbar', { bg = colors.bg_lighter })
  highlight('PmenuThumb', { bg = colors.red })

  -- Status line
  highlight('StatusLine', { fg = colors.red, bg = colors.bg_light })
  highlight('StatusLineNC', { fg = colors.gray2, bg = colors.bg_light })
  highlight('WildMenu', { fg = colors.bg, bg = colors.red })

  -- Tab line
  highlight('TabLine', { fg = colors.gray3, bg = colors.bg_light })
  highlight('TabLineSel', { fg = colors.red, bg = colors.bg, bold = true })
  highlight('TabLineFill', { bg = colors.bg_light })

  -- Messages
  highlight('ModeMsg', { fg = colors.red, bold = true })
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
  highlight('DiffText', { fg = colors.cyan, bg = colors.bg_light, bold = true })

  -- Spelling
  highlight('SpellBad', { undercurl = true, sp = colors.red })
  highlight('SpellCap', { undercurl = true, sp = colors.yellow })
  highlight('SpellLocal', { undercurl = true, sp = colors.cyan })
  highlight('SpellRare', { undercurl = true, sp = colors.magenta })

  -- Syntax highlighting
  highlight('Comment', { fg = colors.gray2, italic = true })
  highlight('Constant', { fg = colors.cyan })
  highlight('String', { fg = colors.green })
  highlight('Character', { fg = colors.green_bright })
  highlight('Number', { fg = colors.magenta })
  highlight('Boolean', { fg = colors.magenta })
  highlight('Float', { fg = colors.magenta })

  highlight('Identifier', { fg = colors.fg })
  highlight('Function', { fg = colors.yellow, bold = true })

  highlight('Statement', { fg = colors.red })
  highlight('Conditional', { fg = colors.red })
  highlight('Repeat', { fg = colors.red })
  highlight('Label', { fg = colors.red_bright })
  highlight('Operator', { fg = colors.cyan })
  highlight('Keyword', { fg = colors.red, bold = true })
  highlight('Exception', { fg = colors.red_bright })

  highlight('PreProc', { fg = colors.magenta })
  highlight('Include', { fg = colors.magenta })
  highlight('Define', { fg = colors.magenta })
  highlight('Macro', { fg = colors.magenta_bright })
  highlight('PreCondit', { fg = colors.magenta })

  highlight('Type', { fg = colors.blue })
  highlight('StorageClass', { fg = colors.blue })
  highlight('Structure', { fg = colors.blue_bright })
  highlight('Typedef', { fg = colors.blue })

  highlight('Special', { fg = colors.cyan_bright })
  highlight('SpecialChar', { fg = colors.cyan })
  highlight('Tag', { fg = colors.red })
  highlight('Delimiter', { fg = colors.fg })
  highlight('SpecialComment', { fg = colors.gray3 })
  highlight('Debug', { fg = colors.red_bright })

  highlight('Underlined', { underline = true })
  highlight('Ignore', { fg = colors.gray1 })
  highlight('Error', { fg = colors.red_bright, bold = true })
  highlight('Todo', { fg = colors.bg, bg = colors.red, bold = true })

  -- Treesitter
  highlight('@variable', { fg = colors.fg })
  highlight('@variable.builtin', { fg = colors.cyan })
  highlight('@variable.parameter', { fg = colors.magenta_bright })
  highlight('@variable.member', { fg = colors.fg })
  highlight('@constant', { fg = colors.cyan })
  highlight('@constant.builtin', { fg = colors.cyan_bright })
  highlight('@module', { fg = colors.blue })
  highlight('@label', { fg = colors.red_bright })
  highlight('@string', { fg = colors.green })
  highlight('@string.escape', { fg = colors.cyan })
  highlight('@string.regexp', { fg = colors.cyan_bright })
  highlight('@character', { fg = colors.green_bright })
  highlight('@number', { fg = colors.magenta })
  highlight('@boolean', { fg = colors.magenta })
  highlight('@float', { fg = colors.magenta })
  highlight('@function', { fg = colors.yellow, bold = true })
  highlight('@function.builtin', { fg = colors.yellow })
  highlight('@function.call', { fg = colors.yellow })
  highlight('@function.method', { fg = colors.yellow })
  highlight('@constructor', { fg = colors.blue_bright })
  highlight('@keyword', { fg = colors.red, bold = true })
  highlight('@keyword.function', { fg = colors.red })
  highlight('@keyword.operator', { fg = colors.red })
  highlight('@keyword.return', { fg = colors.red_bright })
  highlight('@operator', { fg = colors.cyan })
  highlight('@punctuation', { fg = colors.gray3 })
  highlight('@punctuation.bracket', { fg = colors.cyan_bright })
  highlight('@punctuation.delimiter', { fg = colors.gray3 })
  highlight('@type', { fg = colors.blue })
  highlight('@type.builtin', { fg = colors.blue_bright })
  highlight('@attribute', { fg = colors.magenta })
  highlight('@property', { fg = colors.fg })
  highlight('@comment', { fg = colors.gray2, italic = true })
  highlight('@tag', { fg = colors.red })
  highlight('@tag.attribute', { fg = colors.yellow })
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
  highlight('TelescopeBorder', { fg = colors.red })
  highlight('TelescopePromptBorder', { fg = colors.red })
  highlight('TelescopeResultsBorder', { fg = colors.red })
  highlight('TelescopePreviewBorder', { fg = colors.red })
  highlight('TelescopeSelection', { fg = colors.red, bg = colors.bg_light })
  highlight('TelescopeMatching', { fg = colors.cyan, bold = true })

  -- NvimTree
  highlight('NvimTreeNormal', { fg = colors.fg, bg = colors.bg })
  highlight('NvimTreeFolderIcon', { fg = colors.red })
  highlight('NvimTreeFolderName', { fg = colors.cyan })
  highlight('NvimTreeOpenedFolderName', { fg = colors.red })
  highlight('NvimTreeRootFolder', { fg = colors.blue, bold = true })

  -- Which-key
  highlight('WhichKey', { fg = colors.red })
  highlight('WhichKeyGroup', { fg = colors.cyan })
  highlight('WhichKeyDesc', { fg = colors.fg })
  highlight('WhichKeySeparator', { fg = colors.gray2 })

  -- Indent blankline
  highlight('IndentBlanklineChar', { fg = colors.gray1 })
  highlight('IndentBlanklineContextChar', { fg = colors.red })
end

M.setup()

return M
