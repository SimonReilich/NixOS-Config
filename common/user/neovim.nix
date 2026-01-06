{ inputs, pkgs, ... }:

{
  imports = [ inputs.nixvim.homeModules.nixvim ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    # 1. General Settings (replicating NVChad defaults)
    opts = {
      number = true;
      relativenumber = true;
      clipboard = "unnamedplus"; # Use system clipboard
      expandtab = true;
      shiftwidth = 2;
      tabstop = 2;
      ignorecase = true;
      smartcase = true;
      mouse = "a";
      cursorline = true;
      termguicolors = true;
    };

    # 2. Theme (OneDark is the closest match to NVChad's default)
    colorschemes.onedark = {
      enable = true;
      settings = {
        style = "dark";
      };
    };

    # 3. Keymaps (Standard NVChad Bindings)
    globals.mapleader = " ";
    keymaps = [
      # General
      {
        mode = "n";
        key = "<C-s>";
        action = "<cmd>w<CR>";
        options.desc = "Save file";
      }
      {
        mode = "n";
        key = "<C-c>";
        action = "<cmd>%y+<CR>";
        options.desc = "Copy whole file";
      }

      # NvimTree (File Explorer)
      {
        mode = "n";
        key = "<C-n>";
        action = "<cmd>NvimTreeToggle<CR>";
        options.desc = "Toggle Explorer";
      }
      {
        mode = "n";
        key = "<leader>e";
        action = "<cmd>NvimTreeFocus<CR>";
        options.desc = "Focus Explorer";
      }

      # Telescope (Finder)
      {
        mode = "n";
        key = "<leader>fw";
        action = "<cmd>Telescope live_grep<CR>";
        options.desc = "Find words";
      }
      {
        mode = "n";
        key = "<leader>ff";
        action = "<cmd>Telescope find_files<CR>";
        options.desc = "Find files";
      }
      {
        mode = "n";
        key = "<leader>fb";
        action = "<cmd>Telescope buffers<CR>";
        options.desc = "Find buffers";
      }

      # Commenting (Toggle with /)
      {
        mode = "n";
        key = "<leader>/";
        action = "gcc";
        options.remap = true;
        options.desc = "Toggle Comment";
      }
      {
        mode = "v";
        key = "<leader>/";
        action = "gc";
        options.remap = true;
        options.desc = "Toggle Comment";
      }

      # Window Navigation
      {
        mode = "n";
        key = "<C-h>";
        action = "<C-w>h";
        options.desc = "Window Left";
      }
      {
        mode = "n";
        key = "<C-l>";
        action = "<C-w>l";
        options.desc = "Window Right";
      }
      {
        mode = "n";
        key = "<C-j>";
        action = "<C-w>j";
        options.desc = "Window Down";
      }
      {
        mode = "n";
        key = "<C-k>";
        action = "<C-w>k";
        options.desc = "Window Up";
      }

      # Hoogle Search (Telescope)
      {
        mode = "n";
        key = "<leader>hh";
        action = "<cmd>Telescope hoogle<CR>";
        options.desc = "Hoogle Search";
      }

      # Open GHCi Repl
      {
        mode = "n";
        key = "<leader>hr";
        action = "<cmd>Haskell repl toggle<CR>";
        options.desc = "Toggle Haskell REPL";
      }
    ];

    # 4. Plugins
    plugins = {
      # File Explorer
      nvim-tree = {
        enable = true;
        git = {
          enable = true;
        };
        renderer = {
          icons = {
            glyphs = {
              folder = {
                arrow_closed = "";
                arrow_open = "";
              };
            };
          };
        };
      };

      # Fuzzy Finder
      telescope = {
        enable = true;
        extensions.hoogle.enable = true;
      };

      # Syntax Highlighting
      treesitter = {
        enable = true;
        settings = {
          highlight.enable = true;
          indent.enable = true;
          ensure_installed = [
            "bash"
            "c"
            "html"
            "lua"
            "markdown"
            "nix"
            "python"
            "rust"
            "haskell"
            "vim"
            "vimdoc"
          ];
        };
      };

      # Icons (Required for NvimTree/Telescope)
      web-devicons.enable = true;

      # Status Line
      lualine = {
        enable = true;
        # NVChad uses a custom theme, 'onedark' is a safe native fallback
        settings.options.theme = "onedark";
      };

      # Autocompletion (CMP)
      cmp = {
        enable = true;
        autoEnableSources = true;
        settings = {
          sources = [
            { name = "nvim_lsp"; }
            { name = "luasnip"; }
            { name = "buffer"; }
            { name = "path"; }
          ];
          mapping = {
            "<C-p>" = "cmp.mapping.select_prev_item()";
            "<C-n>" = "cmp.mapping.select_next_item()";
            "<C-d>" = "cmp.mapping.scroll_docs(-4)";
            "<C-f>" = "cmp.mapping.scroll_docs(4)";
            "<C-Space>" = "cmp.mapping.complete()";
            "<C-e>" = "cmp.mapping.close()";
            "<CR>" = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true })";
            "<Tab>" =
              "cmp.mapping(function(fallback) if cmp.visible() then cmp.select_next_item() elseif require('luasnip').expand_or_jumpable() then require('luasnip').expand_or_jump() else fallback() end end, {'i', 's'})";
          };
        };
      };

      # Snippets Engine (Required for CMP)
      luasnip.enable = true;
      cmp_luasnip.enable = true;

      # Language Server Protocol (LSP)
      lsp = {
        enable = true;
        servers = {
          # HTML/CSS/JS (Standard web dev stuff)
          html.enable = true;
          cssls.enable = true;

          # Python
          pyright.enable = true;

          # Nix
          nixd.enable = true;

          # Lua
          lua_ls.enable = true;

          # Rust
          rust_analyzer = {
            enable = true;
            installCargo = true;
            installRustc = true;
          };
        };
      };

      # Autoformatting (Optional, but highly recommended)
      conform-nvim = {
        enable = true;
        settings = {
          format_on_save = {
            timeout_ms = 500;
            lsp_fallback = true;
          };
          formatters_by_ft = {
            lua = [ "stylua" ];
            nix = [ "nixpkgs_fmt" ];
            rust = [ "rustfmt" ];
            python = [
              "isort"
              "black"
            ];
            haskell = [ "ormolu" ];
          };
        };
      };

      # Specialized Haskell Tooling
      haskell-tools = {
        enable = true;
      };
    };
  };
}
