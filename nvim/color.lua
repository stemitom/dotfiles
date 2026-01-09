-- NERV Colorscheme for Neovim
-- Inspired by Neon Genesis Evangelion MAGI interface

local M = {}

-- Color palette
local colors = {
  bg = '#0a0a0a',
  bg_light = '#1a1a1a',
  bg_lighter = '#2a2a2a',
  fg = '#cccccc',

  -- NERV signature colors
  orange = '#ff6600',
  orange_bright = '#ff9933',
  amber = '#ff9900',

  -- Accent colors
  red = '#cc0000',
  red_bright = '#ff3333',
  green = '#00cc00',
  green_bright = '#33ff33',
  yellow = '#cccc00',
  yellow_bright = '#ffff33',
  blue = '#0066cc',
  blue_bright = '#3399ff',
  cyan = '#00cccc',
  cyan_bright = '#33ffff',
  magenta = '#cc00cc',
  magenta_bright = '#ff33ff',

  -- Grays
  gray1 = '#333333',
  gray2 = '#666666',
  gray3 = '#999999',

  -- Special
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
  vim.g.colors_name = 'nerv'

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
  highlight('IncSearch', { fg = colors.bg, bg = colors.orange_bright })
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
  highlight('DiffText', { fg = colors.orange, bg = colors.bg_light, bold = true })

  -- Spelling
  highlight('SpellBad', { undercurl = true, sp = colors.red })
  highlight('SpellCap', { undercurl = true, sp = colors.yellow })
  highlight('SpellLocal', { undercurl = true, sp = colors.cyan })
  highlight('SpellRare', { undercurl = true, sp = colors.magenta })

  -- Syntax highlighting
  highlight('Comment', { fg = colors.gray2, italic = true })
  highlight('Constant', { fg = colors.cyan })
  highlight('String', { fg = colors.green })
  highlight('Character', { fg = colors.green })
  highlight('Number', { fg = colors.orange_bright })
  highlight('Boolean', { fg = colors.orange })
  highlight('Float', { fg = colors.orange_bright })

  highlight('Identifier', { fg = colors.fg })
  highlight('Function', { fg = colors.amber, bold = true })

  highlight('Statement', { fg = colors.red })
  highlight('Conditional', { fg = colors.red })
  highlight('Repeat', { fg = colors.red })
  highlight('Label', { fg = colors.orange })
  highlight('Operator', { fg = colors.orange })
  highlight('Keyword', { fg = colors.red, bold = true })
  highlight('Exception', { fg = colors.red_bright })

  highlight('PreProc', { fg = colors.magenta })
  highlight('Include', { fg = colors.magenta })
  highlight('Define', { fg = colors.magenta })
  highlight('Macro', { fg = colors.magenta })
  highlight('PreCondit', { fg = colors.magenta })

  highlight('Type', { fg = colors.yellow })
  highlight('StorageClass', { fg = colors.yellow })
  highlight('Structure', { fg = colors.yellow })
  highlight('Typedef', { fg = colors.yellow })

  highlight('Special', { fg = colors.cyan_bright })
  highlight('SpecialChar', { fg = colors.cyan })
  highlight('Tag', { fg = colors.orange })
  highlight('Delimiter', { fg = colors.fg })
  highlight('SpecialComment', { fg = colors.gray3 })
  highlight('Debug', { fg = colors.red })

  highlight('Underlined', { underline = true })
  highlight('Ignore', { fg = colors.gray1 })
  highlight('Error', { fg = colors.red_bright, bold = true })
  highlight('Todo', { fg = colors.bg, bg = colors.orange, bold = true })

  -- Treesitter
  highlight('@variable', { fg = colors.fg })
  highlight('@variable.builtin', { fg = colors.cyan })
  highlight('@variable.parameter', { fg = colors.orange_bright })
  highlight('@variable.member', { fg = colors.fg })
  highlight('@constant', { fg = colors.cyan })
  highlight('@constant.builtin', { fg = colors.cyan_bright })
  highlight('@module', { fg = colors.yellow })
  highlight('@label', { fg = colors.orange })
  highlight('@string', { fg = colors.green })
  highlight('@string.escape', { fg = colors.cyan })
  highlight('@string.regexp', { fg = colors.cyan_bright })
  highlight('@character', { fg = colors.green })
  highlight('@number', { fg = colors.orange_bright })
  highlight('@boolean', { fg = colors.orange })
  highlight('@float', { fg = colors.orange_bright })
  highlight('@function', { fg = colors.amber, bold = true })
  highlight('@function.builtin', { fg = colors.amber })
  highlight('@function.call', { fg = colors.amber })
  highlight('@function.method', { fg = colors.amber })
  highlight('@constructor', { fg = colors.yellow })
  highlight('@keyword', { fg = colors.red, bold = true })
  highlight('@keyword.function', { fg = colors.red })
  highlight('@keyword.operator', { fg = colors.red })
  highlight('@keyword.return', { fg = colors.red_bright })
  highlight('@operator', { fg = colors.orange })
  highlight('@punctuation', { fg = colors.gray3 })
  highlight('@punctuation.bracket', { fg = colors.gray3 })
  highlight('@punctuation.delimiter', { fg = colors.gray3 })
  highlight('@type', { fg = colors.yellow })
  highlight('@type.builtin', { fg = colors.yellow })
  highlight('@attribute', { fg = colors.magenta })
  highlight('@property', { fg = colors.fg })
  highlight('@comment', { fg = colors.gray2, italic = true })
  highlight('@tag', { fg = colors.red })
  highlight('@tag.attribute', { fg = colors.orange })
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
  highlight('TelescopeBorder', { fg = colors.orange })
  highlight('TelescopePromptBorder', { fg = colors.orange })
  highlight('TelescopeResultsBorder', { fg = colors.orange })
  highlight('TelescopePreviewBorder', { fg = colors.orange })
  highlight('TelescopeSelection', { fg = colors.orange, bg = colors.bg_light })
  highlight('TelescopeMatching', { fg = colors.amber, bold = true })

  -- NvimTree
  highlight('NvimTreeNormal', { fg = colors.fg, bg = colors.bg })
  highlight('NvimTreeFolderIcon', { fg = colors.orange })
  highlight('NvimTreeFolderName', { fg = colors.orange })
  highlight('NvimTreeOpenedFolderName', { fg = colors.orange_bright })
  highlight('NvimTreeRootFolder', { fg = colors.red, bold = true })

  -- Which-key
  highlight('WhichKey', { fg = colors.orange })
  highlight('WhichKeyGroup', { fg = colors.cyan })
  highlight('WhichKeyDesc', { fg = colors.fg })
  highlight('WhichKeySeparator', { fg = colors.gray2 })

  -- Indent blankline
  highlight('IndentBlanklineChar', { fg = colors.gray1 })
  highlight('IndentBlanklineContextChar', { fg = colors.orange })

  -- Notify
  highlight('NotifyERRORBorder', { fg = colors.red })
  highlight('NotifyWARNBorder', { fg = colors.yellow })
  highlight('NotifyINFOBorder', { fg = colors.cyan })
  highlight('NotifyDEBUGBorder', { fg = colors.gray3 })
  highlight('NotifyTRACEBorder', { fg = colors.magenta })
  highlight('NotifyERRORIcon', { fg = colors.red_bright })
  highlight('NotifyWARNIcon', { fg = colors.yellow_bright })
  highlight('NotifyINFOIcon', { fg = colors.cyan_bright })
  highlight('NotifyDEBUGIcon', { fg = colors.gray3 })
  highlight('NotifyTRACEIcon', { fg = colors.magenta_bright })
  highlight('NotifyERRORTitle', { fg = colors.red })
  highlight('NotifyWARNTitle', { fg = colors.yellow })
  highlight('NotifyINFOTitle', { fg = colors.cyan })
  highlight('NotifyDEBUGTitle', { fg = colors.gray3 })
  highlight('NotifyTRACETitle', { fg = colors.magenta })

  -- Mini
  highlight('MiniStatuslineModeNormal', { fg = colors.bg, bg = colors.orange, bold = true })
  highlight('MiniStatuslineModeInsert', { fg = colors.bg, bg = colors.green, bold = true })
  highlight('MiniStatuslineModeVisual', { fg = colors.bg, bg = colors.magenta, bold = true })
  highlight('MiniStatuslineModeReplace', { fg = colors.bg, bg = colors.red, bold = true })
  highlight('MiniStatuslineModeCommand', { fg = colors.bg, bg = colors.yellow, bold = true })
end

M.setup()

return M
