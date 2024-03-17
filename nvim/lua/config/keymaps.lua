local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Do things without affecting the registers
keymap.set('n', 'x', '"_x')
keymap.set('n', '<Leader>p', '"0p')
keymap.set('n', '<Leader>P', '"0P')
keymap.set('v', '<Leader>p', '"0p')
keymap.set('n', '<Leader>c', '"_c')
keymap.set('n', '<Leader>C', '"_C')
keymap.set('v', '<Leader>c', '"_c')
keymap.set('v', '<Leader>C', '"_C')
keymap.set('n', '<Leader>d', '"_d')
keymap.set('n', '<Leader>D', '"_D')
keymap.set('v', '<Leader>d', '"_d')
keymap.set('v', '<Leader>D', '"_D')

-- Diagnostics
-- Goto next diagnostic of any severity
keymap.set('n', ']d', function()
  vim.diagnostic.goto_next {}
  vim.api.nvim_feedkeys('zz', 'n', false)
end)

-- Goto previous diagnostic of any severity
keymap.set('n', '[d', function()
  vim.diagnostic.goto_prev {}
  vim.api.nvim_feedkeys('zz', 'n', false)
end)

-- Goto next error diagnostic
keymap.set('n', ']e', function()
  vim.diagnostic.goto_next { severity = vim.diagnostic.severity.ERROR }
  vim.api.nvim_feedkeys('zz', 'n', false)
end)

-- Goto previous error diagnostic
keymap.set('n', '[e', function()
  vim.diagnostic.goto_prev { severity = vim.diagnostic.severity.ERROR }
  vim.api.nvim_feedkeys('zz', 'n', false)
end)

-- Goto next warning diagnostic
keymap.set('n', ']w', function()
  vim.diagnostic.goto_next { severity = vim.diagnostic.severity.WARN }
  vim.api.nvim_feedkeys('zz', 'n', false)
end)

-- Goto previous warning diagnostic
keymap.set('n', '[w', function()
  vim.diagnostic.goto_prev { severity = vim.diagnostic.severity.WARN }
  vim.api.nvim_feedkeys('zz', 'n', false)
end)

-- Place all dignostics into a qflist
keymap.set('n', '<leader>ld', vim.diagnostic.setqflist, { desc = 'Quickfix [L]ist [D]iagnostics' })

-- Navigate to next qflist item
keymap.set('n', '<leader>cn', ':cnext<cr>zz')

-- Navigate to previos qflist item
keymap.set('n', '<leader>cp', ':cprevious<cr>zz')

-- Open the qflist
keymap.set('n', '<leader>co', ':copen<cr>zz')

-- Close the qflist
keymap.set('n', '<leader>cc', ':cclose<cr>zz')

-- Press 'U' for redo
keymap.set('n', 'U', '<C-r>')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Disable continuations
keymap.set('n', '<Leader>o', 'o<Esc>^Da', opts)
keymap.set('n', '<Leader>O', 'O<Esc>^Da', opts)

-- Jumplist
keymap.set('n', '<C-m>', '<C-i>', opts)

-- Split window
keymap.set('n', 'ss', ':split<Return>', opts)
keymap.set('n', 'sv', ':vsplit<Return>', opts)

-- Resize window
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')

-- Keep cursor centered when scrolling
keymap.set('n', '<C-d>', '<C-d>zz', opts)
keymap.set('n', '<C-u>', '<C-u>zz', opts)

-- Move selected line / block of text in visual mode
keymap.set('v', 'K', ":m '<-2<CR>gv=gv", opts)
keymap.set('v', 'J', ":m '>+1<CR>gv=gv", opts)

-- Fast saving
keymap.set('n', '<Leader>w', ':write!<CR>', opts)
keymap.set('n', '<Leader>q', ':q!<CR>', opts)

-- Rekeymap for dealing with visual line wraps
keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true })
keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- better indenting
keymap.set('v', '<', '<gv')
keymap.set('v', '>', '>gv')

-- paste over currently selected text without yanking it
keymap.set('v', 'p', '"_dp')
keymap.set('v', 'P', '"_dP')

-- copy everything between { and } including the brackets
-- p puts text after the cursor,
-- P puts text before the cursor.
keymap.set('n', 'YY', 'va{Vy', opts)

-- Move line on the screen rather than by line in the file
keymap.set('n', 'j', 'gj', opts)
keymap.set('n', 'k', 'gk', opts)

-- Exit on jj
keymap.set('i', 'jj', '<ESC>', opts)

-- Move to start/end of line
keymap.set({ 'n', 'x', 'o' }, 'H', '^', opts)
keymap.set({ 'n', 'x', 'o' }, 'L', '$', opts)

-- Navigate buffers
keymap.set('n', '<Right>', ':bnext<CR>', opts)
keymap.set('n', '<Left>', ':bprevious<CR>', opts)

-- Panes resizing
keymap.set('n', '+', ':vertical resize +5<CR>')
keymap.set('n', '_', ':vertical resize -5<CR>')
keymap.set('n', '=', ':resize +5<CR>')
keymap.set('n', '-', ':resize -5<CR>')

-- keymap enter to ciw in normal mode
keymap.set('n', '<CR>', 'ciw', opts)
keymap.set('n', '<BS>', 'ci', opts)

-- search current buffer
keymap.set('n', '<C-s>', ':Telescope current_buffer_fuzzy_find<CR>', opts)

-- Split line with X
keymap.set('n', 'X', ':keeppatterns substitute/\\s*\\%#\\s*/\\r/e <bar> normal! ==^<cr>', { silent = true })

-- Select all
keymap.set('n', '<C-a>', 'ggVG', opts)

-- write file in current directory
-- :w %:h/<new-file-name>
keymap.set('n', '<C-n>', ':w %:h/', opts)
