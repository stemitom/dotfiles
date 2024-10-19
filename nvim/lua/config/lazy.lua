local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  -- 'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  --  This is equivalent to:
  --    require('Comment').setup({})
  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  -- Here is a more advanced example where we pass configuration
  -- options to `gitsigns.nvim`. This is equivalent to the following lua:
  --    require('gitsigns').setup({ ... })
  --
  -- See `:help gitsigns` to understand what the configuration keys do
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
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

  { -- indentation guides
    'lukas-reineke/indent-blankline.nvim',
    version = '*',
    event = 'VeryLazy',
    opts = {
      indent = {
        char = '│',
      },
    },
    config = function(_, opts)
      require('ibl').setup(opts)
      vim.cmd.highlight {
        'link @ibl.scope.underline.1 IndentBlanklineContextStart',
        bang = true,
      }
    end,
  },

  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    config = function() -- This is the function that runs, AFTER loading
      require('which-key').setup()

      -- Document existing key chains
      require('which-key').register {
        ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
        ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
        ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
        ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
        ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
      }
    end,
  },

  { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { -- If encountering errors, see telescope-fzf-native README for install instructions
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },

      -- Useful for getting pretty icons, but requires a Nerd Font.
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
      require('telescope').setup {
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }
      -- Enable telescope extensions, if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
      vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

      -- Slightly advanced example of overriding default behavior and theme
      vim.keymap.set('n', '<leader>/', function()
        -- You can pass additional configuration to telescope to change theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })

      -- Also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[S]earch [/] in Open Files' })

      -- Shortcut for searching your neovim configuration files
      vim.keymap.set('n', '<leader>sn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[S]earch [N]eovim files' })
    end,
  },

  { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs and related tools to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',

      -- Useful status updates for LSP.
      { 'j-hui/fidget.nvim', opts = {} },
      { 'folke/neodev.nvim', opts = {} },
    },
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

          -- Find references for the word under your cursor.
          map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

          -- Jump to the implementation of the word under your cursor.
          map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

          -- Jump to the type of the word under your cursor.
          map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')

          -- Fuzzy find all the symbols in your current document.
          map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')

          -- Fuzzy find all the symbols in your current workspace
          --  Similar to document symbols, except searches over your whole project.
          map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

          -- Rename the variable under your cursor
          --  Most Language Servers support renaming across files, etc.
          map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

          -- Execute a code action, usually your cursor needs to be on top of an error
          -- or a suggestion from your LSP for this to activate.
          map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

          -- Opens a popup that displays documentation about the word under your cursor
          --  See `:help K` for why this keymap
          map('K', vim.lsp.buf.hover, 'Hover Documentation')

          -- WARN: This is not Goto Definition, this is Goto Declaration.
          --  For example, in C this would take you to the header
          map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

          -- When you move your cursor, the highlights will be cleared (the second autocommand).
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.server_capabilities.documentHighlightProvider then
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              callback = vim.lsp.buf.clear_references,
            })
          end
        end,
      })
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())
      local servers = {
        rust_analyzer = {
          settings = {
            ['rust-analyzer'] = {
              cargo = {
                allFeatures = true,
              },
              imports = {
                group = {
                  enable = false,
                },
              },
              completion = {
                postfix = {
                  enable = false,
                },
              },
            },
          },
        },
        zig = {
          cmd = { '/opt/homebrew/bin/zls' },
        },
        lua_ls = {
          settings = {
            Lua = {
              completion = {
                callSnippet = 'Replace',
              },
              diagnostics = { disable = { 'missing-fields' } },
            },
          },
        },
        gopls = {},
        tsserver = {},
        solang = {},
        -- pyright = {},
      }

      -- Ensure the servers and tools above are installed
      --  To check the current status of installed tools and/or manually install
      --  other tools, you can run
      --    :Mason
      --
      --  You can press `g?` for help in this menu
      require('mason').setup()

      -- You can add other tools here that you want Mason to install
      -- for you, so that they are available from within Neovim.
      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        'stylua', -- Used to format lua code
      })
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      require('mason-lspconfig').setup {
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            -- This handles overriding only values explicitly passed
            -- by the server configuration above. Useful when disabling
            -- certain features of an LSP (for example, turning off formatting for tsserver)
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
    end,
  },

  { -- Autoformat
    'stevearc/conform.nvim',
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        local disable_filetypes = { c = true, cpp = true }
        return {
          timeout_ms = 500,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        go = { 'gopls' },
        zig = { 'zig fmt' },
        -- python = { 'isort', 'black' },
        -- javascript = { { "prettierd", "prettier" } },
      },
    },
  },

  { -- Autopairs and close brackets
    'm4xshen/autoclose.nvim',
    enabled = true,
    lazy = false,
    config = function()
      require('autoclose').setup {
        options = {
          disabled_filetypes = { 'text', 'markdown' },
        },
      }
    end,
  },

  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      {
        'L3MON4D3/LuaSnip',
        build = (function()
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        dependencies = {},
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
        -- No, but seriously. Please read `:help ins-completion`, it is really good!
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
    end,
  },

  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  -- fzf support for ^p
  {
    'junegunn/fzf.vim',
    dependencies = {
      { 'junegunn/fzf', dir = '~/opts/.fzf', build = './install --all' },
    },
    config = function()
      vim.g.fzf_layout = { down = '~20%' }
      function list_cmd()
        local base = vim.fn.fnamemodify(vim.fn.expand '%', ':h:.:S')
        if base == '.' then
          return 'fd --type file --follow'
        else
          return vim.fn.printf('fd --type file --follow | proximity-sort %s', vim.fn.shellescape(vim.fn.expand '%'))
        end
      end
      vim.api.nvim_create_user_command('Files', function(arg)
        vim.fn['fzf#vim#files'](arg.qargs, { source = list_cmd(), options = '--tiebreak=index' }, arg.bang)
      end, { bang = true, nargs = '?', complete = 'dir' })
      vim.keymap.set('', '<C-p>', '<cmd>Files<cr>')
      vim.keymap.set('n', '<leader>;', '<cmd>Buffers<cr>')
    end,
  },

  { -- Harpoon for tracking files and buffers
    'ThePrimeagen/harpoon',
    branch = 'master',
    event = 'VeryLazy',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    opts = {
      menu = {
        width = 120,
      },
    },
    config = function()
      vim.keymap.set('n', '<leader>ha', require('harpoon.mark').add_file)
      vim.keymap.set('n', '<leader>hh', require('harpoon.ui').toggle_quick_menu)
      vim.keymap.set('n', '<leader>h1', function()
        require('harpoon.ui').nav_file(1)
      end)
      vim.keymap.set('n', '<leader>h2', function()
        require('harpoon.ui').nav_file(2)
      end)
      vim.keymap.set('n', '<leader>h3', function()
        require('harpoon.ui').nav_file(3)
      end)
      vim.keymap.set('n', '<leader>h4', function()
        require('harpoon.ui').nav_file(4)
      end)
      vim.keymap.set('n', '<leader>h5', function()
        require('harpoon.ui').nav_file(5)
      end)
      vim.keymap.set('n', '<leader>h6', function()
        require('harpoon.ui').nav_file(6)
      end)
      vim.keymap.set('n', '<leader>h7', function()
        require('harpoon.ui').nav_file(7)
      end)
      vim.keymap.set('n', '<leader>h8', function()
        require('harpoon.ui').nav_file(8)
      end)
      vim.keymap.set('n', '<leader>h9', function()
        require('harpoon.ui').nav_file(9)
      end)
    end,
  },

  -- Nvim and Tmux Navigator
  {
    'alexghergh/nvim-tmux-navigation',
    config = function()
      require('nvim-tmux-navigation').setup {
        disable_when_zoomed = true,
      }
      local TERM = os.getenv 'TERM'
      vim.keymap.set('n', '<C-j>', function()
        if vim.fn.exists ':KittyNavigateDown' ~= 0 and TERM == 'xterm-kitty' then
          vim.cmd.KittyNavigateDown()
        elseif vim.fn.exists ':TmuxNavigateDown' ~= 0 then
          vim.cmd.TmuxNavigateDown()
        elseif vim.fn.exists ':NvimTmuxNavigateDown' ~= 0 then
          vim.cmd.NvimTmuxNavigateDown()
        else
          vim.cmd.wincmd 'j'
        end
      end)

      vim.keymap.set('n', '<C-k>', function()
        if vim.fn.exists ':KittyNavigateUp' ~= 0 and TERM == 'xterm-kitty' then
          vim.cmd.KittyNavigateUp()
        elseif vim.fn.exists ':NvimTmuxNavigateUp' ~= 0 then
          vim.cmd.NvimTmuxNavigateUp()
        else
          vim.cmd.wincmd 'k'
        end
      end)

      vim.keymap.set('n', '<C-l>', function()
        if vim.fn.exists ':KittyNavigateRight' ~= 0 and TERM == 'xterm-kitty' then
          vim.cmd.KittyNavigateRight()
        elseif vim.fn.exists ':NvimTmuxNavigateRight' ~= 0 then
          vim.cmd.NvimTmuxNavigateRight()
        else
          vim.cmd.wincmd 'l'
        end
      end)

      vim.keymap.set('n', '<C-h>', function()
        if vim.fn.exists ':KittyNavigateLeft' ~= 0 and TERM == 'xterm-kitty' then
          vim.cmd.KittyNavigateLeft()
        elseif vim.fn.exists ':NvimTmuxNavigateLeft' ~= 0 then
          vim.cmd.NvimTmuxNavigateLeft()
        else
          vim.cmd.wincmd 'h'
        end
      end)
    end,
  },

  { -- File Tree
    'nvim-neo-tree/neo-tree.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    event = 'VeryLazy',
    keys = {
      { '<leader>e', ':Neotree toggle float<CR>', silent = true, desc = 'Float File Explorer' },
      { '<leader><tab>', ':Neotree toggle left<CR>', silent = true, desc = 'Left File Explorer' },
    },
    config = function()
      require('neo-tree').setup {
        close_if_last_window = true,
        popup_border_style = 'single',
        enable_git_status = true,
        enable_modified_markers = true,
        enable_diagnostics = true,
        sort_case_insensitive = true,
        default_component_configs = {
          indent = {
            with_markers = true,
            with_expanders = true,
          },
          modified = {
            symbol = ' ',
            highlight = 'NeoTreeModified',
          },
          icon = {
            folder_closed = '',
            folder_open = '',
            folder_empty = '',
            folder_empty_open = '',
          },
          git_status = {
            symbols = {
              -- Change type
              added = '',
              deleted = '',
              modified = '',
              renamed = '',
              -- Status type
              untracked = '',
              ignored = '',
              unstaged = '',
              staged = '',
              conflict = '',
            },
          },
        },
        window = {
          position = 'float',
          width = 35,
        },
        filesystem = {
          use_libuv_file_watcher = true,
          filtered_items = {
            hide_dotfiles = true,
            hide_gitignored = true,
            hide_by_name = {
              'node_modules',
            },
            never_show = {
              '.DS_Store',
              'thumbs.db',
            },
          },
        },
        event_handlers = {
          {
            event = 'neo_tree_window_after_open',
            handler = function(args)
              if args.position == 'left' or args.position == 'right' then
                vim.cmd 'wincmd ='
              end
            end,
          },
          {
            event = 'neo_tree_window_after_close',
            handler = function(args)
              if args.position == 'left' or args.position == 'right' then
                vim.cmd 'wincmd ='
              end
            end,
          },
        },
      }
    end,
  },

  { -- Status line
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'linrongbin16/lsp-progress.nvim',
    },
    opts = {
      options = {
        icons_enabled = false,
        theme = 'auto',
        component_separators = { left = '|', right = '|' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
          statusline = { 'neo-tree', 'help', 'Trouble' },
          winbar = {},
        },
      },
      sections = {
        lualine_c = {
          {
            'filename',
            file_status = true,
            newfile_status = false,
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

  { -- Gruvbox Dark Colorscheme
    'sainnhe/gruvbox-material',
    enabled = true,
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_transparent_background = 1
      vim.g.gruvbox_material_foreground = 'original'
      vim.g.gruvbox_material_background = 'medium'
      vim.g.gruvbox_material_ui_contrast = 'high'
      vim.g.gruvbox_material_float_style = 'bright'
      vim.g.gruvbox_material_statusline_style = 'original'
      vim.g.gruvbox_material_cursor = 'auto'

      vim.g.gruvbox_material_colors_override = { bg0 = '#000000' } -- #0e1010
      vim.g.gruvbox_material_colors_override = { bg0 = '#121212' }
      vim.g.gruvbox_material_better_performance = 1

      -- vim.cmd.colorscheme 'gruvbox-material'
    end,
  },

  { -- Cyberdream
    'scottmckendry/cyberdream.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'cyberdream'
    end,
  },

  { -- Base16
    'RRethy/base16-nvim',
    enabled = true,
    priority = 1000,
    config = function()
      require('base16-colorscheme').with_config {}
      -- vim.cmd.colorscheme 'base16-material-darker'
    end,
  },

  { -- Tokyonight
    'folke/tokyonight.nvim',
    enabled = true,
    priority = 1000,
    config = function()
      require('tokyonight').setup {}
      -- vim.cmd.colorscheme 'tokyonight-night'
    end,
  },

  { -- Kanagawa
    'rebelot/kanagawa.nvim',
    enabled = true,
    priority = 1000,
    config = function()
      require('kanagawa').setup {
        keywordStyle = { italic = false },
        statementStyle = { bold = true },
      }
      -- vim.cmd.colorscheme 'kanagawa-dragon'
    end,
  },

  { -- Vesper
    'datsfilipe/vesper.nvim',
    enabled = true,
    priority = 1000,
    config = function()
      require('vesper').setup {
        italics = {
          comments = false, -- Boolean: Italicizes comments
          keywords = false, -- Boolean: Italicizes keywords
          functions = false, -- Boolean: Italicizes functions
          strings = false, -- Boolean: Italicizes strings
          variables = false, -- Boolean: Italicizes variables
        },
      }
      -- vim.cmd.colorscheme 'vesper'
    end,
  },

  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [']quote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()

      -- Simple and easy statusline.
      --  You could remove this setup call if you don't like it,
      --  and try some other statusline plugin
      -- local statusline = require 'mini.statusline'
      -- -- set use_icons to true if you have a Nerd Font
      -- statusline.setup { use_icons = vim.g.have_nerd_font }
      --
      -- -- You can configure sections in the statusline by overriding their
      -- -- default behavior. For example, here we set the section for
      -- -- cursor location to LINE:COLUMN
      -- ---@diagnostic disable-next-line: duplicate-set-field
      -- statusline.section_location = function()
      --   return '%2l:%-2v'
      -- end

      -- ... and there is more!
      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },

  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
      ensure_installed = { 'bash', 'c', 'html', 'lua', 'markdown', 'vim', 'vimdoc', 'go' },
      auto_install = true,
      highlight = {
        enable = true,
        -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
        --  If you are experiencing weird indenting issues, add the language to
        --  the list of additional_vim_regex_highlighting and disabled languages for indent.
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
    },
    config = function(_, opts)
      -- [[ Configure Treesitter ]] See `:help nvim-treesitter`

      ---@diagnostic disable-next-line: missing-fields
      require('nvim-treesitter.configs').setup(opts)

      -- There are additional nvim-treesitter modules that you can use to interact
      -- with nvim-treesitter. You should go explore a few and see what interests you:
      --
      --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
      --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
      --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    end,
  },
  { import = 'plugins' },
}, {
  ui = {
    -- If you have a Nerd Font, set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})
