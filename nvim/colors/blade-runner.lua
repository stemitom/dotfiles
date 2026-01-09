-- Blade Runner Colorscheme for Neovim
-- Dystopian orange aesthetic in the city of perpetual rain

local M = {}

-- Color palette
local colors = {
  bg = '#0a0e1a',
  bg_light = '#1a1e2a',
  bg_lighter = '#3a3e4a',
  fg = '#e6d5ac',

  -- Signature blade runner colors
  orange = '#ff8c00',
  orange_bright = '#ffaa33',
  amber = '#ffd700',
  amber_bright = '#ffe033',
  teal = '#00b8d4',
  teal_bright = '#33ccee',
  cyan = '#00e5ff',
  cyan_bright = '#33f0ff',
  pink = '#ff4081',
  pink_bright = '#ff66aa',
  red = '#ff1744',
  red_bright = '#ff5a7a',
  green = '#00e676',
  green_bright = '#33ffa0',
  beige = '#d5c5a5',

  -- Grays
  gray1 = '#2a2e3a',
  gray2 = '#4a4e5a',
  gray3 = '#9a9a8a',

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
  vim.g.colors_name = 'blade-runner'

  -- Editor
  highlight('Normal', { fg = colors.fg, bg = colors.bg })
  highlight('NormalFloat', { fg = colors.fg, bg = colors.bg_light })
  highlight('Cursor', { fg = colors.bg, bg = colors.orange })
  highlight('CursorLine', { bg = colors.bg_light })
  highlight('CursorColumn', { bg = colors.bg_light })
  highlight('ColorColumn', { bg = colors.bg_light })
  highlight('LineNr', { fg = colors.gray2, bg = colors.bg })
  highlight('CursorLineNr', { fg = colors.orange, bg = colors.bg_light, bold = true })
  highlight('SignColumn', { fg = colors.fg, bg = colors.bg })
  highlight('VertSplit', { fg = colors.orange, bg = colors.bg })
  highlight('WinSeparator', { fg = colors.orange, bg = colors.bg })
  highlight('Folded', { fg = colors.gray3, bg = colors.bg_light })
  highlight('FoldColumn', { fg = colors.gray2, bg = colors.bg })
  highlight('NonText', { fg = colors.gray1 })
  highlight('SpecialKey', { fg = colors.gray1 })
  highlight('EndOfBuffer', { fg = colors.bg })

  -- Search
  highlight('Search', { fg = colors.bg, bg = colors.amber })
  highlight('IncSearch', { fg = colors.bg, bg = colors.orange })
  highlight('CurSearch', { fg = colors.bg, bg = colors.orange })

  -- Popup menu
  highlight('Pmenu', { fg = colors.fg, bg = colors.bg_light })
  highlight('PmenuSel', { fg = colors.bg, bg = colors.orange })
  highlight('PmenuSbar', { bg = colors.bg_lighter })
  highlight('PmenuThumb', { bg = colors.orange })

  -- Status line
  highlight('StatusLine', { fg = colors.orange, bg = colors.bg_light })
  highlight('StatusLineNC', { fg = colors.gray2, bg = colors.bg_light })
  highlight('WildMenu', { fg = colors.bg, bg = colors.orange })

  -- Tab line
  highlight('TabLine', { fg = colors.gray3, bg = colors.bg_light })
  highlight('TabLineSel', { fg = colors.orange, bg = colors.bg, bold = true })
  highlight('TabLineFill', { bg = colors.bg_light })

  -- Messages
  highlight('ModeMsg', { fg = colors.orange, bold = true })
  highlight('MoreMsg', { fg = colors.green })
  highlight('WarningMsg', { fg = colors.amber })
  highlight('ErrorMsg', { fg = colors.red_bright, bold = true })
  highlight('Question', { fg = colors.teal })

  -- Visual
  highlight('Visual', { bg = colors.bg_lighter })
  highlight('VisualNOS', { bg = colors.bg_lighter })

  -- Diff
  highlight('DiffAdd', { fg = colors.green, bg = colors.bg_light })
  highlight('DiffChange', { fg = colors.amber, bg = colors.bg_light })
  highlight('DiffDelete', { fg = colors.red, bg = colors.bg_light })
  highlight('DiffText', { fg = colors.orange, bg = colors.bg_light, bold = true })

  -- Spelling
  highlight('SpellBad', { undercurl = true, sp = colors.red })
  highlight('SpellCap', { undercurl = true, sp = colors.amber })
  highlight('SpellLocal', { undercurl = true, sp = colors.teal })
  highlight('SpellRare', { undercurl = true, sp = colors.pink })

  -- Syntax highlighting
  highlight('Comment', { fg = colors.gray2, italic = true })
  highlight('Constant', { fg = colors.teal })
  highlight('String', { fg = colors.green })
  highlight('Character', { fg = colors.green_bright })
  highlight('Number', { fg = colors.amber })
  highlight('Boolean', { fg = colors.orange })
  highlight('Float', { fg = colors.amber })

  highlight('Identifier', { fg = colors.beige })
  highlight('Function', { fg = colors.orange, bold = true })

  highlight('Statement', { fg = colors.pink })
  highlight('Conditional', { fg = colors.pink })
  highlight('Repeat', { fg = colors.pink })
  highlight('Label', { fg = colors.orange })
  highlight('Operator', { fg = colors.cyan })
  highlight('Keyword', { fg = colors.pink, bold = true })
  highlight('Exception', { fg = colors.red_bright })

  highlight('PreProc', { fg = colors.pink_bright })
  highlight('Include', { fg = colors.pink_bright })
  highlight('Define', { fg = colors.pink_bright })
  highlight('Macro', { fg = colors.pink_bright })
  highlight('PreCondit', { fg = colors.pink })

  highlight('Type', { fg = colors.teal })
  highlight('StorageClass', { fg = colors.teal_bright })
  highlight('Structure', { fg = colors.teal })
  highlight('Typedef', { fg = colors.teal_bright })

  highlight('Special', { fg = colors.cyan })
  highlight('SpecialChar', { fg = colors.cyan_bright })
  highlight('Tag', { fg = colors.orange })
  highlight('Delimiter', { fg = colors.beige })
  highlight('SpecialComment', { fg = colors.gray3 })
  highlight('Debug', { fg = colors.red })

  highlight('Underlined', { underline = true })
  highlight('Ignore', { fg = colors.gray1 })
  highlight('Error', { fg = colors.red_bright, bold = true })
  highlight('Todo', { fg = colors.bg, bg = colors.orange, bold = true })

  -- Treesitter
  highlight('@variable', { fg = colors.beige })
  highlight('@variable.builtin', { fg = colors.teal })
  highlight('@variable.parameter', { fg = colors.amber })
  highlight('@variable.member', { fg = colors.beige })
  highlight('@constant', { fg = colors.teal })
  highlight('@constant.builtin', { fg = colors.teal_bright })
  highlight('@module', { fg = colors.teal })
  highlight('@label', { fg = colors.orange })
  highlight('@string', { fg = colors.green })
  highlight('@string.escape', { fg = colors.cyan })
  highlight('@string.regexp', { fg = colors.teal })
  highlight('@character', { fg = colors.green_bright })
  highlight('@number', { fg = colors.amber })
  highlight('@boolean', { fg = colors.orange })
  highlight('@float', { fg = colors.amber })
  highlight('@function', { fg = colors.orange, bold = true })
  highlight('@function.builtin', { fg = colors.orange })
  highlight('@function.call', { fg = colors.orange })
  highlight('@function.method', { fg = colors.orange })
  highlight('@constructor', { fg = colors.teal_bright })
  highlight('@keyword', { fg = colors.pink, bold = true })
  highlight('@keyword.function', { fg = colors.pink })
  highlight('@keyword.operator', { fg = colors.pink })
  highlight('@keyword.return', { fg = colors.red_bright })
  highlight('@operator', { fg = colors.cyan })
  highlight('@punctuation', { fg = colors.gray3 })
  highlight('@punctuation.bracket', { fg = colors.cyan_bright })
  highlight('@punctuation.delimiter', { fg = colors.gray3 })
  highlight('@type', { fg = colors.teal })
  highlight('@type.builtin', { fg = colors.teal_bright })
  highlight('@attribute', { fg = colors.pink_bright })
  highlight('@property', { fg = colors.beige })
  highlight('@comment', { fg = colors.gray2, italic = true })
  highlight('@tag', { fg = colors.pink })
  highlight('@tag.attribute', { fg = colors.orange })
  highlight('@tag.delimiter', { fg = colors.gray3 })

  -- LSP
  highlight('DiagnosticError', { fg = colors.red_bright })
  highlight('DiagnosticWarn', { fg = colors.amber })
  highlight('DiagnosticInfo', { fg = colors.teal })
  highlight('DiagnosticHint', { fg = colors.cyan })
  highlight('DiagnosticUnderlineError', { undercurl = true, sp = colors.red })
  highlight('DiagnosticUnderlineWarn', { undercurl = true, sp = colors.amber })
  highlight('DiagnosticUnderlineInfo', { undercurl = true, sp = colors.teal })
  highlight('DiagnosticUnderlineHint', { undercurl = true, sp = colors.cyan })
  highlight('LspReferenceText', { bg = colors.bg_lighter })
  highlight('LspReferenceRead', { bg = colors.bg_lighter })
  highlight('LspReferenceWrite', { bg = colors.bg_lighter })

  -- Git signs
  highlight('GitSignsAdd', { fg = colors.green })
  highlight('GitSignsChange', { fg = colors.amber })
  highlight('GitSignsDelete', { fg = colors.red })

  -- Telescope
  highlight('TelescopeBorder', { fg = colors.orange })
  highlight('TelescopePromptBorder', { fg = colors.orange })
  highlight('TelescopeResultsBorder', { fg = colors.orange })
  highlight('TelescopePreviewBorder', { fg = colors.orange })
  highlight('TelescopeSelection', { fg = colors.orange, bg = colors.bg_light })
  highlight('TelescopeMatching', { fg = colors.amber, bold = true })

  -- NvimTree
  highlight('NvimTreeNormal', { fg = colors.fg, bg = colors.bg })
  highlight('NvimTreeFolderIcon', { fg = colors.orange })
  highlight('NvimTreeFolderName', { fg = colors.teal })
  highlight('NvimTreeOpenedFolderName', { fg = colors.orange })
  highlight('NvimTreeRootFolder', { fg = colors.pink, bold = true })

  -- Which-key
  highlight('WhichKey', { fg = colors.orange })
  highlight('WhichKeyGroup', { fg = colors.teal })
  highlight('WhichKeyDesc', { fg = colors.fg })
  highlight('WhichKeySeparator', { fg = colors.gray2 })

  -- Indent blankline
  highlight('IndentBlanklineChar', { fg = colors.gray1 })
  highlight('IndentBlanklineContextChar', { fg = colors.orange })
end

M.setup()

return M
