{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    # ============================================================================
    # PLUGINS
    # ============================================================================
    plugins = with pkgs.vimPlugins; [
      # Theme
      dracula-nvim

      # LSP & Completion
      nvim-lspconfig
      nvim-cmp
      cmp-nvim-lsp
      cmp-buffer # NEW: Buffer completion
      cmp-path # NEW: Path completion
      luasnip
      cmp_luasnip
      none-ls-nvim

      # File Navigation
      telescope-nvim
      telescope-fzf-native-nvim # NEW: Faster fuzzy finding
      nvim-tree-lua
      plenary-nvim
      harpoon2 # NEW: Quick file navigation

      # UI Enhancements
      lualine-nvim
      indent-blankline-nvim
      nvim-web-devicons
      which-key-nvim
      rainbow
      gitsigns-nvim # NEW: Git integration
      alpha-nvim # NEW: Startup screen
      snacks-nvim # NEW: Collection of useful utilities

      # Editing
      nvim-autopairs
      comment-nvim
      ferret
      opencode-nvim
      vim-surround # NEW: Bracket/quote manipulation
      nvim-colorizer-lua # NEW: Color preview
      trouble-nvim # NEW: Diagnostics list

      # Treesitter (Syntax Highlighting)
      (pkgs.vimPlugins.nvim-treesitter.withPlugins (p: [
        p.lua
        p.nix
        p.bash
        p.javascript
        p.python
        p.json
        p.markdown
        p.html # NEW
        p.css # NEW
        p.yaml # NEW
        p.toml # NEW
      ]))
      nvim-treesitter-context # NEW: Shows context at top
    ];

    # ============================================================================
    # CONFIGURATION
    # ============================================================================
    extraLuaConfig = ''
      -- ==========================================================================
      -- BASIC SETTINGS
      -- ==========================================================================
      vim.opt.number = true
      vim.opt.relativenumber = true
      vim.opt.expandtab = true
      vim.opt.shiftwidth = 2
      vim.opt.tabstop = 2
      vim.opt.termguicolors = true
      vim.opt.signcolumn = "yes"
      vim.opt.updatetime = 250
      vim.opt.timeoutlen = 300
      vim.opt.mouse = "a"                    -- NEW: Mouse support
      vim.opt.clipboard = "unnamedplus"      -- NEW: System clipboard
      vim.opt.ignorecase = true              -- NEW: Case insensitive search
      vim.opt.smartcase = true               -- NEW: Unless capital in search
      vim.opt.scrolloff = 8                  -- NEW: Keep 8 lines visible
      vim.opt.wrap = false                   -- NEW: No line wrapping
      vim.opt.swapfile = false               -- NEW: No swap files
      vim.opt.backup = false                 -- NEW: No backup files
      vim.opt.undofile = true                -- NEW: Persistent undo

      -- Leader key
      vim.g.mapleader = " "
      vim.g.maplocalleader = " "

      -- Theme
      vim.cmd.colorscheme("dracula")

      -- ==========================================================================
      -- TREESITTER (Syntax Highlighting)
      -- ==========================================================================
      require("nvim-treesitter.configs").setup {
        highlight = { enable = true },
        indent = { enable = true },
        rainbow = {
          enable = true,
          extended_mode = true,
          max_file_lines = nil,
        }
      }

      -- NEW: Treesitter Context (shows function/class at top)
      require("treesitter-context").setup {
        enable = true,
        max_lines = 3,
      }

      -- ==========================================================================
      -- COMPLETION (nvim-cmp)
      -- ==========================================================================
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'buffer' },   -- NEW
          { name = 'path' },     -- NEW
        })
      })

      -- ==========================================================================
      -- LSP CONFIGURATION
      -- ==========================================================================
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      -- LSP keybindings (activated when LSP attaches)
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          local opts = { buffer = ev.buf }
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
          vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
          vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
          vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
          vim.keymap.set('n', '<leader>f', function()
            vim.lsp.buf.format { async = true }
          end, opts)
        end,
      })

      -- Configure LSP servers
      vim.lsp.config('lua_ls', { capabilities = capabilities })
      vim.lsp.config('nixd', { capabilities = capabilities })
      vim.lsp.config('bashls', { capabilities = capabilities })

      -- Enable LSP servers
      vim.lsp.enable({ 'lua_ls', 'nixd', 'bashls' })

      -- ==========================================================================
      -- FORMATTING (none-ls)
      -- ==========================================================================
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.nixfmt,
          null_ls.builtins.formatting.prettier,
        },
      })

      -- ==========================================================================
      -- NEW: GIT INTEGRATION (gitsigns)
      -- ==========================================================================
      require("gitsigns").setup {
        signs = {
          add          = { text = '│' },
          change       = { text = '│' },
          delete       = { text = '_' },
          topdelete    = { text = '‾' },
          changedelete = { text = '~' },
        },
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          -- Navigation
          vim.keymap.set('n', ']c', function()
            if vim.wo.diff then return ']c' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
          end, {expr=true, buffer=bufnr, desc="Next git hunk"})

          vim.keymap.set('n', '[c', function()
            if vim.wo.diff then return '[c' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
          end, {expr=true, buffer=bufnr, desc="Previous git hunk"})

          -- Actions
          vim.keymap.set('n', '<leader>hs', gs.stage_hunk, {buffer=bufnr, desc="Stage hunk"})
          vim.keymap.set('n', '<leader>hr', gs.reset_hunk, {buffer=bufnr, desc="Reset hunk"})
          vim.keymap.set('n', '<leader>hp', gs.preview_hunk, {buffer=bufnr, desc="Preview hunk"})
          vim.keymap.set('n', '<leader>hb', gs.blame_line, {buffer=bufnr, desc="Blame line"})
        end
      }

      -- ==========================================================================
      -- PLUGIN SETUPS (Simple Configs)
      -- ==========================================================================
      require("nvim-autopairs").setup {}
      require("Comment").setup {}
      require("ibl").setup {}
      require("which-key").setup {}

      -- NEW: Color preview in code
      require("colorizer").setup {}

      -- NEW: Better diagnostics list
      require("trouble").setup {}

      -- NEW: Startup screen
      require("alpha").setup(require("alpha.themes.startify").config)

      -- NEW: Snacks.nvim (Useful utilities)
      require("snacks").setup({
        bigfile = { enabled = true },       -- Disable features for large files
        notifier = { enabled = true },      -- Better notifications
        quickfile = { enabled = true },     -- Faster file opening
        statuscolumn = { enabled = true },  -- Better status column
        words = { enabled = true },         -- Highlight word under cursor
        styles = {
          notification = {
            wo = { wrap = true }            -- Wrap notifications
          }
        }
      })

      require("lualine").setup {
        options = {
          theme = 'dracula',
          icons_enabled = true,
        },
        sections = {
          lualine_c = {
            {
              'filename',
              path = 1,  -- NEW: Show relative path
            }
          },
        }
      }

      -- File Tree (nvim-tree)
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
      require("nvim-tree").setup {
        view = {
          width = 35,
        },
        filters = {
          dotfiles = false,  -- NEW: Show hidden files
        },
        git = {
          enable = true,
          ignore = false,
        },
      }

      -- Fuzzy Finder (Telescope)
      require("telescope").setup {
        defaults = {
          file_ignore_patterns = { "node_modules", ".git/" },
          layout_config = {
            horizontal = { width = 0.9 },
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
          }
        }
      }
      require("telescope").load_extension("fzf")

      -- NEW: Harpoon (Quick file navigation)
      local harpoon = require("harpoon")
      harpoon:setup()

      -- ==========================================================================
      -- KEYBINDINGS
      -- ==========================================================================
      local builtin = require('telescope.builtin')

      -- Telescope (Fuzzy Finding)
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live grep' })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find buffers' })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Help tags' })
      vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = 'Recent files' })  -- NEW
      vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = 'Find word under cursor' })  -- NEW

      -- File Tree
      vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { desc = 'Toggle file tree' })
      vim.keymap.set('n', '<leader>o', ':NvimTreeFocus<CR>', { desc = 'Focus file tree' })

      -- NEW: Harpoon (Quick file marks)
      vim.keymap.set('n', '<leader>a', function() harpoon:list():add() end, { desc = 'Harpoon add file' })
      vim.keymap.set('n', '<C-e>', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = 'Harpoon menu' })
      vim.keymap.set('n', '<C-h>', function() harpoon:list():select(1) end, { desc = 'Harpoon file 1' })
      vim.keymap.set('n', '<C-t>', function() harpoon:list():select(2) end, { desc = 'Harpoon file 2' })
      vim.keymap.set('n', '<C-n>', function() harpoon:list():select(3) end, { desc = 'Harpoon file 3' })
      vim.keymap.set('n', '<C-s>', function() harpoon:list():select(4) end, { desc = 'Harpoon file 4' })

      -- NEW: Trouble (Diagnostics)
      vim.keymap.set('n', '<leader>xx', ':Trouble diagnostics toggle<CR>', { desc = 'Toggle diagnostics' })
      vim.keymap.set('n', '<leader>xw', ':Trouble diagnostics toggle filter.buf=0<CR>', { desc = 'Buffer diagnostics' })

      -- NEW: Better window navigation
      vim.keymap.set('n', '<C-Left>', '<C-w>h', { desc = 'Window left' })
      vim.keymap.set('n', '<C-Down>', '<C-w>j', { desc = 'Window down' })
      vim.keymap.set('n', '<C-Up>', '<C-w>k', { desc = 'Window up' })
      vim.keymap.set('n', '<C-Right>', '<C-w>l', { desc = 'Window right' })

      -- NEW: Quick save and quit
      vim.keymap.set('n', '<leader>w', ':w<CR>', { desc = 'Save file' })
      vim.keymap.set('n', '<leader>q', ':q<CR>', { desc = 'Quit' })

      -- NEW: Move lines up/down in visual mode
      vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move line down' })
      vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move line up' })

      -- NEW: Stay in indent mode
      vim.keymap.set('v', '<', '<gv', { desc = 'Indent left' })
      vim.keymap.set('v', '>', '>gv', { desc = 'Indent right' })

      -- NEW: Snacks.nvim keybindings
      vim.keymap.set('n', '<leader>n', function() require("snacks").notifier.show_history() end, { desc = 'Notification History' })
      vim.keymap.set('n', '<leader>bd', function() require("snacks").bufdelete() end, { desc = 'Delete Buffer' })
      vim.keymap.set('n', '<leader>gb', function() require("snacks").git.blame_line() end, { desc = 'Git Blame Line' })
      vim.keymap.set('n', '<leader>gf', function() require("snacks").lazygit.log_file() end, { desc = 'Git File History' })
      vim.keymap.set('n', '<leader>gg', function() require("snacks").lazygit() end, { desc = 'Lazygit' })
      vim.keymap.set('n', '<leader>gl', function() require("snacks").lazygit.log() end, { desc = 'Git Log' })
      vim.keymap.set('n', '<leader>un', function() require("snacks").notifier.hide() end, { desc = 'Dismiss All Notifications' })
    '';
  };
}
