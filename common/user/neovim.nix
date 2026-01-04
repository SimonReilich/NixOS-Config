{ inputs, pkgs, ... }:

let
  init = ''
    vim.g.dap_virtual_text = true
  '';

  # FIX 1: Update paths to match the flat structure (removed "custom.")
  chadrc = ''
    ---@type ChadrcConfig
    local M = {}
    M.ui = { theme = "doomchad" }
    M.plugins = "plugins"         -- Was "custom.plugins"
    M.mappings = require "mappings" -- Was require "custom.mappings"
    return M
  '';

  mappings = ''
    local M = {}

    M.dap = {
      plugin = true,
      n = {
        ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>" },
        ["<leader>dus"] = {
          function ()
            local widgets = require("dap.ui.widgets");
            local sidebar = widgets.sidebar(widgets.scopes);
            sidebar.open();
          end,
          "Open debugging sidebar"
        }
      }
    }

    M.crates = {
      plugin = true,
      n = {
        ["<leader>rcu"] = {
          function ()
            require("crates").upgrade_all_crates()
          end,
          "update crates"
        }
      }
    }

    return M
  '';

  # FIX 2: Removed "core.utils" calls and fixed require paths
  plugins = ''
    local cmp = require "cmp"

    local plugins = {
      {
        "williamboman/mason.nvim",
        opts = {
          ensure_installed = {
            "rust-analyzer",
          },
        },
      },
      {
        "neovim/nvim-lspconfig",
        config = function()
          require "nvchad.configs.lspconfig" -- Load default NVChad config first
          require "configs.lspconfig"        -- Fixed path: Was "plugins.configs..."
        end,
      },
      {
        "mrcjkb/rustaceanvim",
        version = "^4",
        ft = { "rust" },
        dependencies = "neovim/nvim-lspconfig",
        config = function()
          require "configs.rustaceanvim"     -- Fixed path: Was "custom.configs..."
        end
      },
      {
        "mfussenegger/nvim-dap",
        -- REMOVED: init = function() require("core.utils").load_mappings("dap") end
        -- Reason: Mappings in M.dap (mappings.lua) are loaded automatically now.
      },
      {
        "saecki/crates.nvim",
        ft = {"toml"},
        config = function(_, opts)
          local crates  = require("crates")
          crates.setup(opts)
          require("cmp").setup.buffer({
            sources = { { name = "crates" }}
          })
          crates.show()
          -- REMOVED: require("core.utils").load_mappings("crates")
        end,
      },
      {
        "rust-lang/rust.vim",
        ft = "rust",
        init = function ()
          vim.g.rustfmt_autosave = 1
        end
      },
      {
        "theHamsta/nvim-dap-virtual-text",
        lazy = false,
        config = function(_, opts)
          require("nvim-dap-virtual-text").setup()
        end
      },
      {
        "hrsh7th/nvim-cmp",
        opts = function()
          -- WARNING: You were requiring "plugins.configs.cmp" which does not exist.
          -- We usually extend the default config here:
          local M = require "nvchad.configs.cmp"
          M.completion.completeopt = "menu,menuone,noselect"
          M.mapping["<CR>"] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Insert,
            select = false,
          }
          table.insert(M.sources, {name = "crates"})
          return M
        end,
      }
    }
    return plugins
  '';

  # FIX 3: Fixed require paths inside the config files
  lsp-config = ''
    local on_attach = require("nvchad.configs.lspconfig").on_attach
    local capabilities = require("nvchad.configs.lspconfig").capabilities

    local lspconfig = require "lspconfig"
    local util = require "lspconfig/util"
  '';

  rust-tools = ''
    local on_attach = require("nvchad.configs.lspconfig").on_attach
    local capabilities = require("nvchad.configs.lspconfig").capabilities

    local options = {
      server = {
        on_attach = on_attach,
        capabilities = capabilities,
      }
    }

    return options
  '';

  rust-aceanvim = ''
    local on_attach = require("nvchad.configs.lspconfig").on_attach
    local capabilities = require("nvchad.configs.lspconfig").capabilities

    vim.g.rustaceanvim = {
      server = {
        on_attach = on_attach,
        capabilities = capabilities,
      }
    }
  '';

  patchedNvChad = pkgs.runCommand "nvchad-patched" { } ''
    mkdir -p $out
    cp -r ${inputs.nvchad}/. $out/
    chmod -R u+w $out

    # 1. Use cat <<EOF for init.lua
    cat <<EOF > $out/lua/init.lua
    ${init}
    EOF

    # 2. Use cat <<EOF for chadrc.lua
    cat <<EOF > $out/lua/chadrc.lua
    ${chadrc}
    EOF

    # 3. Use cat <<EOF for mappings.lua
    cat <<EOF > $out/lua/mappings.lua
    ${mappings}
    EOF

    # 4. FIX: Changed 'echo' to 'cat <<EOF' for plugins.lua to handle quotes and <CR> correctly
    cat <<EOF > $out/lua/plugins.lua
    ${plugins}
    EOF

    # Create configs directory
    mkdir -p $out/lua/configs

    # 5. FIX: Changed 'echo' to 'cat <<EOF' for all config files
    cat <<EOF > $out/lua/configs/lspconfig.lua
    ${lsp-config}
    EOF

    cat <<EOF > $out/lua/configs/rust-tools.lua
    ${rust-tools}
    EOF

    cat <<EOF > $out/lua/configs/rustaceanvim.lua
    ${rust-aceanvim}
    EOF
  '';

in
{
  programs.neovim = {
    enable = true;
  };

  home.packages = with pkgs; [
    ripgrep
    gnumake
    gcc
    unzip
    wget
    curl
  ];

  xdg.configFile."nvim".source = patchedNvChad;
}
