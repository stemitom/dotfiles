-- always set leader first!
vim.keymap.set('n', '<Space>', '<Nop>', { silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-------------------------------------------------------------------------------
--
-- preferences
--
-------------------------------------------------------------------------------

-- General
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.have_nerd_font = true

vim.opt.lazyredraw = true
vim.opt.ttyfast = true

-- UI
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes'
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.wrap = false
vim.opt.colorcolumn = '80'
vim.opt.termguicolors = true
vim.opt.showmode = false
vim.opt.showcmd = false
vim.opt.ruler = false
vim.opt.title = true
vim.opt.fillchars = { eob = ' ' }
vim.opt.listchars = 'tab:^ ,nbsp:¬,extends:»,precedes:«,trail:•'

-- Splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Tabs and indentation
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true
vim.opt.breakindent = true

-- Search
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Files
vim.opt.undofile = true
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.writebackup = false
vim.opt.fileencoding = 'utf-8'

-- Completion
vim.opt.completeopt = { 'menuone', 'noselect' }
vim.opt.pumheight = 5
vim.opt.wildmode = 'list:longest'
vim.opt.wildignore = '.hg,.svn,*~,*.png,*.jpg,*.gif,*.min.js,*.swp,*.o,vendor,dist,_site'

-- Misc
vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamedplus'
vim.opt.conceallevel = 0
vim.opt.timeoutlen = 1000
vim.opt.updatetime = 300
vim.opt.confirm = true
vim.opt.cmdheight = 1
vim.opt.showtabline = 0

-- Diff
vim.opt.diffopt:append 'iwhite'
vim.opt.diffopt:append 'algorithm:histogram'
vim.opt.diffopt:append 'indent-heuristic'

-- Folding
vim.opt.foldenable = false
vim.opt.foldmethod = 'manual'
vim.opt.foldlevelstart = 99

-- Never make terminal beep
vim.opt.vb = true

-------------------------------------------------------------------------------
--
-- hotkeys
--
-------------------------------------------------------------------------------
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Esc alternatives
keymap.set('i', 'jj', '<Esc>')
keymap.set('n', '<Esc>', ':nohlsearch<CR>', opts)

-- Better command mode
keymap.set('n', ';', ':')

-- U for redo
keymap.set('n', 'U', '<C-r>')

-- H/L to start/end of line
keymap.set({ 'n', 'x', 'o' }, 'H', '^', opts)
keymap.set({ 'n', 'x', 'o' }, 'L', '$', opts)

-- Better j/k with line wraps
keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true })
keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true })

-- Center search results
keymap.set('n', 'n', 'nzz', opts)
keymap.set('n', 'N', 'Nzz', opts)
keymap.set('n', '*', '*zz', opts)
keymap.set('n', '#', '#zz', opts)
keymap.set('n', 'g*', 'g*zz', opts)

-- Center scrolling
keymap.set('n', '<C-d>', '<C-d>zz', opts)
keymap.set('n', '<C-u>', '<C-u>zz', opts)

-- Split line with X
keymap.set('n', 'X', ':keeppatterns substitute/\\s*\\%#\\s*/\\r/e <bar> normal! ==^<cr>', opts)

-- "very magic" (less escaping needed) regexes by default
keymap.set('n', '?', '?\\v')
keymap.set('n', '/', '/\\v')
keymap.set('c', '%s/', '%sm/')

-- Split window
keymap.set('n', 'ss', ':split | wincmd p<CR>', opts)
keymap.set('n', 'sv', ':vsplit | wincmd p<CR>', opts)

-- Resize window
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')

-- Panes resizing alternative
keymap.set('n', '+', ':vertical resize +5<CR>')
keymap.set('n', '_', ':vertical resize -5<CR>')
keymap.set('n', '=', ':resize +5<CR>')
keymap.set('n', '-', ':resize -5<CR>')

-- Navigate buffers
keymap.set('n', '<Left>', ':bprevious<CR>', opts)
keymap.set('n', '<Right>', ':bnext<CR>', opts)
keymap.set('n', '<leader><leader>', '<c-^>')

-- Move selected lines in visual mode
keymap.set('v', 'K', ":m '<-2<CR>gv=gv", opts)
keymap.set('v', 'J', ":m '>+1<CR>gv=gv", opts)

-- Better indenting
keymap.set('v', '<', '<gv')
keymap.set('v', '>', '>gv')

-- Paste over selection without yanking
keymap.set('v', 'p', '"_dp')
keymap.set('v', 'P', '"_dP')

-- Do things without affecting the registers
keymap.set('n', 'x', '"_x')
keymap.set('n', '<leader>d', '"_d')
keymap.set('n', '<leader>D', '"_D')
keymap.set('v', '<leader>d', '"_d')
keymap.set('v', '<leader>D', '"_D')
keymap.set('n', '<leader>c', '"_c')
keymap.set('n', '<leader>C', '"_C')
keymap.set('v', '<leader>c', '"_c')
keymap.set('v', '<leader>C', '"_C')

-- Fast saving
keymap.set('n', '<leader>w', ':write!<CR>', opts)
keymap.set('n', '<leader>q', ':q!<CR>', opts)

-- Select all
keymap.set('n', '<C-a>', 'ggVG', opts)

-- Copy everything between { and }
keymap.set('n', 'YY', 'va{Vy', opts)

-- Open new file adjacent to current file
keymap.set('n', '<leader>o', ':e <C-R>=expand("%:p:h") . "/" <cr>')
keymap.set('n', '<C-n>', ':e <C-R>=expand("%:p:h") . "/" <cr>')

-- Disable continuations
keymap.set('n', '<leader>O', 'O<Esc>^Da', opts)

-- Toggle hidden characters
keymap.set('n', '<leader>,', ':set invlist<cr>')

-- Enter to change word
-- keymap.set('n', '<CR>', 'ciw', opts)
keymap.set('n', '<BS>', 'ci', opts)

-- Jumplist
keymap.set('n', '<C-m>', '<C-i>', opts)

-- Quickfix navigation
keymap.set('n', '[q', ':cprev<CR>zz', opts)
keymap.set('n', ']q', ':cnext<CR>zz', opts)
keymap.set('n', '<leader>qo', ':copen<CR>', { desc = 'Open quickfix list' })
keymap.set('n', '<leader>qc', ':cclose<CR>', { desc = 'Close quickfix list' })

-- Diagnostics navigation
keymap.set('n', '[d', function()
  vim.diagnostic.jump { count = -1 }
  vim.api.nvim_feedkeys('zz', 'n', false)
end)
keymap.set('n', ']d', function()
  vim.diagnostic.jump { count = 1 }
  vim.api.nvim_feedkeys('zz', 'n', false)
end)
keymap.set('n', '[e', function()
  vim.diagnostic.jump { count = -1, severity = vim.diagnostic.severity.ERROR }
  vim.api.nvim_feedkeys('zz', 'n', false)
end)
keymap.set('n', ']e', function()
  vim.diagnostic.jump { count = 1, severity = vim.diagnostic.severity.ERROR }
  vim.api.nvim_feedkeys('zz', 'n', false)
end)
keymap.set('n', '[w', function()
  vim.diagnostic.jump { count = -1, severity = vim.diagnostic.severity.WARN }
  vim.api.nvim_feedkeys('zz', 'n', false)
end)
keymap.set('n', ']w', function()
  vim.diagnostic.jump { count = 1, severity = vim.diagnostic.severity.WARN }
  vim.api.nvim_feedkeys('zz', 'n', false)
end)
keymap.set('n', '<leader>ld', vim.diagnostic.setqflist, { desc = 'Quickfix [L]ist [D]iagnostics' })
keymap.set('n', '<leader>e', vim.diagnostic.open_float)

-- F1 is close to Esc
keymap.set('', '<F1>', '<Esc>')
keymap.set('i', '<F1>', '<Esc>')

-------------------------------------------------------------------------------
--
-- autocommands
--
-------------------------------------------------------------------------------

-- Highlight yanked text
-- vim.api.nvim_create_autocmd('TextYankPost', {
--   pattern = '*',
--   callback = function()
--     vim.highlight.on_yank { timeout = 500 }
--   end,
-- })

-- Jump to last edit position on opening file
vim.api.nvim_create_autocmd('BufReadPost', {
  pattern = '*',
  callback = function()
    if vim.fn.line '\'"' > 1 and vim.fn.line '\'"' <= vim.fn.line '$' then
      if not vim.fn.expand('%:p'):find('.git', 1, true) then
        vim.cmd 'exe "normal! g\'\\""'
      end
    end
  end,
})

-- Prevent accidental writes to buffers that shouldn't be edited
vim.api.nvim_create_autocmd('BufRead', { pattern = '*.orig', command = 'set readonly' })
vim.api.nvim_create_autocmd('BufRead', { pattern = '*.pacnew', command = 'set readonly' })

-- Leave paste mode when leaving insert mode
vim.api.nvim_create_autocmd('InsertLeave', { pattern = '*', command = 'set nopaste' })

-------------------------------------------------------------------------------
--
-- diagnostics
--
-------------------------------------------------------------------------------
vim.diagnostic.config { virtual_text = true, virtual_lines = false }

-------------------------------------------------------------------------------
--
-- plugin configuration
--
-------------------------------------------------------------------------------

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- Setup plugins
require('lazy').setup {
  {
    'sainnhe/gruvbox-material',
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_transparent_background = 1
      vim.g.gruvbox_material_foreground = 'original'
      vim.g.gruvbox_material_background = 'medium'
      vim.g.gruvbox_material_ui_contrast = 'high'
      vim.g.gruvbox_material_float_style = 'bright'
      vim.g.gruvbox_material_statusline_style = 'original'
      vim.g.gruvbox_material_cursor = 'auto'
      vim.g.gruvbox_material_colors_override = { bg0 = '#121212' }
      vim.g.gruvbox_material_better_performance = 1
      vim.cmd.colorscheme 'gruvbox-material'
    end,
  },

  -- Statusline
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = {
        icons_enabled = false,
        theme = 'auto',
        component_separators = { left = '|', right = '|' },
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_c = {
          {
            'filename',
            file_status = true,
            path = 1,
            symbols = {
              modified = '[+]',
              readonly = '[-]',
            },
          },
        },
        lualine_x = { 'encoding', 'filetype' },
      },
    },
  },

  -- Center Editor
  {
    'shortcuts/no-neck-pain.nvim',
    version = '*',
    opts = {
      mappings = {
        enabled = true,
        toggle = false,
        toggleLeftSide = false,
        toggleRightSide = false,
        widthUp = false,
        widthDown = false,
        scratchPad = false,
      },
    },
    config = function()
      vim.keymap.set('', '<leader>t', function()
        vim.cmd [[
					:NoNeckPain
					:set formatoptions-=tc linebreak tw=0 cc=0 wrap wm=20 noautoindent nocindent nosmartindent indentkeys=
				]]
        -- make 0, ^ and $ behave better in wrapped text
        vim.keymap.set('n', '0', 'g0')
        vim.keymap.set('n', '$', 'g$')
        vim.keymap.set('n', '^', 'g^')
      end)
    end,
  },

  -- File navigation
  {
    'ibhagwan/fzf-lua',
    config = function()
      local fzf = require 'fzf-lua'

      fzf.setup {
        winopts = {
          split = 'belowright 10new',
          -- preview = { hidden = true },
        },
        files = {
          file_icons = false,
          git_icons = true,
          _fzf_nth_devicons = true,
        },
        buffers = {
          file_icons = false,
          git_icons = true,
        },
        fzf_opts = {
          ['--layout'] = 'default',
        },
      }

      vim.keymap.set('', '<C-p>', function()
        opts.cmd = 'fd --color=never --hidden --type f --type l --exclude .git'
        local base = vim.fn.fnamemodify(vim.fn.expand '%', ':h:.:S')
        if base ~= '.' then
          opts.cmd = opts.cmd .. (' | proximity-sort %s'):format(vim.fn.shellescape(vim.fn.expand '%'))
        end
        opts.fzf_opts = {
          ['--scheme'] = 'path',
          ['--tiebreak'] = 'index',
          ['--layout'] = 'default',
        }
        fzf.files(opts)
      end)

      vim.keymap.set('n', '<leader>sf', fzf.files)

      vim.keymap.set('n', '<leader>;', function()
        fzf.buffers {
          fzf_opts = {
            ['--with-nth'] = '{-3..-2}',
            ['--nth'] = '-1',
            ['--delimiter'] = '[:\u{2002}]',
            ['--header-lines'] = 'false',
          },
          header = false,
        }
      end)

      vim.keymap.set('n', '<leader>sg', fzf.live_grep)
      vim.keymap.set('n', '<leader>sw', fzf.grep_cword)
      vim.keymap.set('n', '<C-s>', fzf.blines)

      vim.keymap.set('n', '<leader>s.', fzf.oldfiles)
      vim.keymap.set('n', '<leader>sh', fzf.help_tags)
      vim.keymap.set('n', '<leader>sk', fzf.keymaps)

      vim.keymap.set('n', '<leader>sn', function()
        fzf.files {
          cwd = vim.fn.stdpath 'config',
          cmd = 'fd --color=never --type f --follow',
        }
      end)
    end,
  },

  -- File tree
  {
    'nvim-neo-tree/neo-tree.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    event = 'VeryLazy',
    keys = {
      { '<leader><tab>', ':Neotree toggle left<CR>', silent = true, desc = 'Left File Explorer' },
    },
    opts = {
      close_if_last_window = true,
      window = { position = 'float', width = 35 },
      filesystem = {
        filtered_items = {
          hide_dotfiles = true,
          hide_gitignored = true,
          hide_by_name = { 'node_modules' },
          never_show = { '.DS_Store', 'thumbs.db' },
        },
      },
    },
  },

  -- Harpoon
  {
    'ThePrimeagen/harpoon',
    branch = 'master',
    event = 'VeryLazy',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { menu = { width = 120 } },
    config = function()
      keymap.set('n', '<leader>ha', require('harpoon.mark').add_file)
      keymap.set('n', '<leader>hh', require('harpoon.ui').toggle_quick_menu)
      for i = 1, 9 do
        keymap.set('n', '<leader>h' .. i, function()
          require('harpoon.ui').nav_file(i)
        end)
      end
    end,
  },

  -- Tmux navigation
  {
    'alexghergh/nvim-tmux-navigation',
    config = function()
      require('nvim-tmux-navigation').setup {
        disable_when_zoomed = true,
        keybindings = {
          left = '<C-h>',
          down = '<C-j>',
          up = '<C-k>',
          right = '<C-l>',
        },
      }
    end,
  },

  -- Git integration
  {
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  -- LSP Configuration
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      { 'j-hui/fidget.nvim', opts = {} },
      { 'folke/neodev.nvim', opts = {} },
    },
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc)
            keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          map('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')

          map('gr', vim.lsp.buf.references, '[G]oto [R]eferences')
          map('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
          map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
          map('K', vim.lsp.buf.hover, 'Hover Documentation')
          map('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
          map('<leader>ds', vim.lsp.buf.document_symbol, '[D]ocument [S]ymbols')
          map('<leader>ws', vim.lsp.buf.workspace_symbol, '[W]orkspace [S]ymbols')
          map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
          map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
          map('<leader>f', function()
            vim.lsp.buf.format { async = true }
          end, '[F]ormat')

          -- Commented out: LSP document highlighting (performance improvement)
          -- local client = vim.lsp.get_client_by_id(event.data.client_id)
          -- if client and client.server_capabilities.documentHighlightProvider then
          -- 	vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
          -- 		buffer = event.buf,
          -- 		callback = vim.lsp.buf.document_highlight,
          -- 	})
          -- 	vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
          -- 		buffer = event.buf,
          -- 		callback = vim.lsp.buf.clear_references,
          -- 	})
          -- end
        end,
      })

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

      local servers = {
        rust_analyzer = {
          settings = {
            ['rust-analyzer'] = {
              cargo = { allFeatures = true },
              imports = { group = { enable = false } },
              completion = { postfix = { enable = false } },
            },
          },
        },
        lua_ls = {
          settings = {
            Lua = {
              completion = { callSnippet = 'Replace' },
              diagnostics = { disable = { 'missing-fields' } },
            },
          },
        },
        gopls = {},
        pyright = {
          settings = {
            python = {
              analysis = {
                autoSearchPaths = true,
                diagnosticMode = 'workspace',
                useLibraryCodeForTypes = true,
                typeCheckingMode = 'basic',
              },
            },
          },
        },
        ruff = {},
        zls = {},
      }

      require('mason').setup()
      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, { 'stylua' })
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      require('mason-lspconfig').setup {
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
    end,
  },

  -- Autoformat
  {
    'stevearc/conform.nvim',
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        local disable_filetypes = { c = true, cpp = true }
        return {
          timeout_ms = 250,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        go = { 'gopls' },
        python = { 'ruff_format', 'ruff_organize_imports' },
        zig = { 'zigfmt' },
      },
    },
  },

  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      {
        'L3MON4D3/LuaSnip',
        build = (function()
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
      },
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
    },
    config = function()
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      luasnip.config.setup {}

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = { completeopt = 'menu,menuone,noinsert' },
        mapping = cmp.mapping.preset.insert {
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-y>'] = cmp.mapping.confirm { select = true },
          ['<C-Space>'] = cmp.mapping.complete {},
          ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          },
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'path' },
        },
      }

      -- Enable completing paths in command mode
      cmp.setup.cmdline(':', {
        sources = cmp.config.sources {
          { name = 'path' },
        },
      })
    end,
  },

  -- Autopairs
  {
    'm4xshen/autoclose.nvim',
    event = 'InsertEnter',
    opts = {
      options = {
        disabled_filetypes = { 'text', 'markdown' },
      },
    },
  },

  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
      ensure_installed = { 'bash', 'c', 'html', 'lua', 'markdown', 'vim', 'vimdoc', 'go', 'rust', 'python', 'zig' },
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
    },
    config = function(_, _)
      require('nvim-treesitter.configs').setup(opts)
    end,
  },

  -- Mini.nvim utilities
  {
    'echasnovski/mini.nvim',
    config = function()
      require('mini.ai').setup { n_lines = 500 }
      require('mini.surround').setup()
    end,
  },

  -- Comments
  { 'numToStr/Comment.nvim', opts = {} },

  -- Todo comments
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },

  -- Which-key
  {
    'folke/which-key.nvim',
    event = 'VimEnter',
    config = function()
      require('which-key').setup()
      require('which-key').add {
        { '<leader>c', group = '[C]ode' },
        { '<leader>d', group = '[D]ocument' },
        { '<leader>r', group = '[R]ename' },
        { '<leader>s', group = '[S]earch' },
        { '<leader>w', group = '[W]orkspace' },
        { '<leader>h', group = '[H]arpoon' },
      }
    end,
  },

  -- Indent guides
  {
    'lukas-reineke/indent-blankline.nvim',
    event = 'VeryLazy',
    opts = {
      indent = { char = '│' },
      scope = {
        enabled = true,
        show_start = false,
        show_end = false,
      },
    },
    config = function(_, opts)
      require('ibl').setup(opts)
    end,
  },

  -- Language-specific plugins

  -- Rust
  {
    'rust-lang/rust.vim',
    ft = { 'rust' },
    config = function()
      vim.g.rustfmt_autosave = 1
      vim.g.rustfmt_emit_files = 1
      vim.g.rustfmt_fail_silently = 0
    end,
  },

  -- Go
  {
    'ray-x/go.nvim',
    dependencies = {
      'ray-x/guihua.lua',
      'neovim/nvim-lspconfig',
      'nvim-treesitter/nvim-treesitter',
      'leoluz/nvim-dap-go',
    },
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      require('go').setup {
        capabilities = capabilities,
        lsp_cfg = {
          settings = {
            gopls = {
              gofumpt = true,
              analyses = {
                fieldalignment = false,
                nilness = true,
                unusedparams = true,
                unusedwrite = true,
                useany = true,
              },
              usePlaceholders = true,
              completeUnimported = true,
              staticcheck = true,
              semanticTokens = false,
            },
          },
        },
        luasnip = false,
        trouble = false,
        lsp_inlay_hints = { enable = false },
      }
    end,
    ft = { 'go', 'gomod' },
    build = ':lua require("go.install").update_all_sync()',
  },

  -- TypeScript
  {
    'pmizio/typescript-tools.nvim',
    ft = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact' },
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    opts = {
      settings = {
        separate_diagnostic_server = true,
        expose_as_code_action = 'all',
        complete_function_calls = true,
      },
    },
  },

  -- Python
  -- LSP: pyright (type checking) + ruff (linting/formatting)
  -- Formatting: ruff_format + ruff_organize_imports (replaces black + isort)

  -- Zig
  {
    'ziglang/zig.vim',
    ft = 'zig',
    config = function()
      vim.g.zig_fmt_autosave = 1
    end,
  },

  -- Debug Adapter Protocol
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'nvim-neotest/nvim-nio',
      'williamboman/mason.nvim',
      'jay-babu/mason-nvim-dap.nvim',
      'leoluz/nvim-dap-go',
    },
    config = function()
      local dap = require 'dap'
      local dapui = require 'dapui'

      require('mason-nvim-dap').setup {
        automatic_setup = true,
        handlers = {},
        ensure_installed = { 'delve' },
      }

      keymap.set('n', '<F5>', dap.continue, { desc = 'Debug: Start/Continue' })
      keymap.set('n', '<F1>', dap.step_into, { desc = 'Debug: Step Into' })
      keymap.set('n', '<F2>', dap.step_over, { desc = 'Debug: Step Over' })
      keymap.set('n', '<F3>', dap.step_out, { desc = 'Debug: Step Out' })
      keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
      keymap.set('n', '<leader>B', function()
        dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
      end, { desc = 'Debug: Set Breakpoint' })

      dapui.setup {
        icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
        controls = {
          icons = {
            pause = '⏸',
            play = '▶',
            step_into = '⏎',
            step_over = '⏭',
            step_out = '⏮',
            step_back = 'b',
            run_last = '▶▶',
            terminate = '⏹',
            disconnect = '⏏',
          },
        },
      }

      keymap.set('n', '<F7>', dapui.toggle, { desc = 'Debug: Toggle UI' })

      dap.listeners.after.event_initialized['dapui_config'] = dapui.open
      dap.listeners.before.event_terminated['dapui_config'] = dapui.close
      dap.listeners.before.event_exited['dapui_config'] = dapui.close

      require('dap-go').setup()
    end,
  },
}
