-- Neon Evangelion Theme
-- Inspired by NERV UI aesthetics
vim.cmd 'hi clear'
if vim.fn.exists 'syntax_on' then
  vim.cmd 'syntax reset'
end
vim.g.colors_name = 'neon_evangelion'
local colors = {
  black = '#000000',
  dark_black = '#050505',
  grey = '#303030',
  light_grey = '#606060',

  -- NERV Palette
  amber = '#ffb300', -- Primary text / "ACTIVE TIME"
  neon_green = '#2ec27e', -- "NORMAL" / Borders / Graphs
  alert_red = '#ff0000', -- "STOP" / "EXTERNAL" / Critical
  dark_red = '#550000',

  -- UI Elements
  selection = '#202020',
  comment = '#606060',
}
local hl = function(group, fg, bg, attr)
  fg = fg and 'guifg=' .. fg or 'guifg=NONE'
  bg = bg and 'guibg=' .. bg or 'guibg=NONE'
  attr = attr and 'gui=' .. attr or 'gui=NONE'
  vim.cmd('hi ' .. group .. ' ' .. fg .. ' ' .. bg .. ' ' .. attr)
end
-- Editor Basics
hl('Normal', colors.amber, colors.black)
hl('NonText', colors.grey, colors.black)
hl('EndOfBuffer', colors.black, colors.black)
hl('LineNr', colors.neon_green, colors.black)
hl('CursorLine', nil, colors.selection)
hl('CursorLineNr', colors.alert_red, colors.selection, 'bold')
hl('Visual', nil, colors.grey)
hl('Search', colors.black, colors.amber)
hl('CurSearch', colors.black, colors.alert_red)
hl('MatchParen', colors.alert_red, colors.black, 'bold')
-- UI / Status
hl('StatusLine', colors.black, colors.neon_green, 'bold')
hl('StatusLineNC', colors.amber, colors.grey)
hl('VertSplit', colors.neon_green, colors.black)
hl('WinSeparator', colors.neon_green, colors.black)
hl('Pmenu', colors.amber, colors.grey)
hl('PmenuSel', colors.black, colors.amber)
-- Syntax Highlighting
hl('Comment', colors.comment, nil, 'italic')
hl('Constant', colors.neon_green, nil, 'bold') -- Numbers, Booleans
hl('String', colors.neon_green, nil)
hl('Character', colors.neon_green, nil)
hl('Number', colors.neon_green, nil)
hl('Boolean', colors.neon_green, nil, 'bold')
hl('Float', colors.neon_green, nil)
hl('Identifier', colors.amber, nil) -- Variables
hl('Function', colors.amber, nil, 'bold')
hl('Statement', colors.alert_red, nil, 'bold') -- Keywords: if, then, else
hl('Conditional', colors.alert_red, nil, 'bold')
hl('Repeat', colors.alert_red, nil, 'bold')
hl('Label', colors.alert_red, nil)
hl('Operator', colors.neon_green, nil)
hl('Keyword', colors.alert_red, nil, 'bold')
hl('Exception', colors.alert_red, nil, 'bold')
hl('PreProc', colors.alert_red, nil) -- Macros
hl('Include', colors.alert_red, nil)
hl('Define', colors.alert_red, nil)
hl('Macro', colors.alert_red, nil)
hl('PreCondit', colors.alert_red, nil)
hl('Type', colors.amber, nil, 'bold') -- Classes, Types
hl('StorageClass', colors.alert_red, nil)
hl('Structure', colors.alert_red, nil)
hl('Typedef', colors.alert_red, nil)
hl('Special', colors.neon_green, nil)
hl('SpecialChar', colors.neon_green, nil)
hl('Tag', colors.neon_green, nil)
hl('Delimiter', colors.neon_green, nil)
hl('SpecialComment', colors.neon_green, nil)
hl('Debug', colors.alert_red, nil)
hl('Underlined', colors.amber, nil, 'underline')
hl('Ignore', colors.grey, nil)
hl('Error', colors.black, colors.alert_red, 'bold')
hl('Todo', colors.black, colors.amber, 'bold')
-- Git (Diff)
hl('DiffAdd', colors.black, colors.neon_green)
hl('DiffChange', colors.black, colors.amber)
hl('DiffDelete', colors.black, colors.alert_red)
hl('DiffText', colors.black, colors.amber, 'bold')
-- Diagnostics
hl('DiagnosticError', colors.alert_red, nil)
hl('DiagnosticWarn', colors.amber, nil)
hl('DiagnosticInfo', colors.neon_green, nil)
hl('DiagnosticHint', colors.grey, nil)

