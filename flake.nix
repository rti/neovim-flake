{
  description = "rti Neovim, based on Luca's simple Neovim flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/release-22.05";

    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    flake-utils = {
      url = "github:numtide/flake-utils";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    neovim-flake = {
      url = "github:neovim/neovim/release-0.8?dir=contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    "java-debug-bin" = { url = "github:rti/java-debug/0.40.0-bin"; flake = false; };

    "plugin_nvim-lua_popup.nvim" = { url = "github:nvim-lua/popup.nvim"; flake = false; };
    "plugin_nvim-lua_plenary.nvim" = { url = "github:nvim-lua/plenary.nvim"; flake = false; };

    "plugin_nvim-tree_nvim-web-devicons" = { url = "github:nvim-tree/nvim-web-devicons"; flake = false; };

    "plugin_nvim-treesitter_nvim-treesitter-textobjects" = { url = "github:nvim-treesitter/nvim-treesitter-textobjects"; flake = false; };
    "plugin_JoosepAlviste_nvim-ts-context-commentstring" = { url = "github:JoosepAlviste/nvim-ts-context-commentstring"; flake = false; };
    "plugin_windwp_nvim-ts-autotag" = { url = "github:windwp/nvim-ts-autotag"; flake = false; };
    "plugin_p00f_nvim-ts-rainbow" = { url = "github:p00f/nvim-ts-rainbow"; flake = false; };

    "plugin_neovim_nvim-lspconfig" = { url = "github:neovim/nvim-lspconfig"; flake = false; };
    "plugin_jose-elias-alvarez_null-ls.nvim" = { url = "github:jose-elias-alvarez/null-ls.nvim"; flake = false; };
    "plugin_j-hui_fidget.nvim" = { url = "github:j-hui/fidget.nvim"; flake = false; };
    "plugin_mfussenegger_nvim-jdtls" = { url = "github:mfussenegger/nvim-jdtls"; flake = false; };
    "plugin_SmiteshP_nvim-gps" = { url = "github:SmiteshP/nvim-gps"; flake = false; };
    "plugin_simrat39_symbols-outline.nvim" = { url = "github:simrat39/symbols-outline.nvim"; flake = false; };
    "plugin_kosayoda_nvim-lightbulb" = { url = "github:kosayoda/nvim-lightbulb"; flake = false; };
    "plugin_weilbith_nvim-code-action-menu" = { url = "github:weilbith/nvim-code-action-menu"; flake = false; };
    "plugin_ray-x_lsp_signature.nvim" = { url = "github:ray-x/lsp_signature.nvim"; flake = false; };

    "plugin_hrsh7th_nvim-cmp" = { url = "github:hrsh7th/nvim-cmp"; flake = false; };
    "plugin_hrsh7th_cmp-path" = { url = "github:hrsh7th/cmp-path"; flake = false; };
    "plugin_hrsh7th_cmp-cmdline" = { url = "github:hrsh7th/cmp-cmdline"; flake = false; };
    "plugin_hrsh7th_cmp-nvim-lsp" = { url = "github:hrsh7th/cmp-nvim-lsp"; flake = false; };
    "plugin_hrsh7th_cmp-nvim-lsp-signature-help" = { url = "github:hrsh7th/cmp-nvim-lsp-signature-help"; flake = false; };
    "plugin_hrsh7th_cmp-buffer" = { url = "github:hrsh7th/cmp-buffer"; flake = false; };
    "plugin_hrsh7th_cmp-vsnip" = { url = "github:hrsh7th/cmp-vsnip"; flake = false; };
    "plugin_hrsh7th_vim-vsnip" = { url = "github:hrsh7th/vim-vsnip"; flake = false; };
    "plugin_rafamadriz_friendly-snippets" = { url = "github:rafamadriz/friendly-snippets"; flake = false; };
    "plugin_windwp_nvim-autopairs" = { url = "github:windwp/nvim-autopairs"; flake = false; };

    "plugin_nvim-telescope_telescope.nvim" = { url = "github:nvim-telescope/telescope.nvim"; flake = false; };

    "plugin_tpope_vim-surround" = { url = "github:tpope/vim-surround"; flake = false; };
    "plugin_tpope_vim-speeddating" = { url = "github:tpope/vim-speeddating"; flake = false; };
    "plugin_tpope_vim-repeat" = { url = "github:tpope/vim-repeat"; flake = false; };
    "plugin_tpope_vim-commentary" = { url = "github:tpope/vim-commentary"; flake = false; };

    "plugin_tpope_vim-fugitive" = { url = "github:tpope/vim-fugitive"; flake = false; };
    "plugin_lewis6991_gitsigns.nvim" = { url = "github:lewis6991/gitsigns.nvim"; flake = false; };
    "plugin_sindrets_diffview.nvim" = { url = "github:sindrets/diffview.nvim"; flake = false; };

    "plugin_bkad_CamelCaseMotion" = { url = "github:bkad/CamelCaseMotion"; flake = false; };
    "plugin_famiu_bufdelete.nvim" = { url = "github:famiu/bufdelete.nvim"; flake = false; };

    "plugin_sbdchd_neoformat" = { url = "github:sbdchd/neoformat"; flake = false; };

    "plugin_Pocco81_auto-save.nvim" = { url = "github:Pocco81/auto-save.nvim"; flake = false; };
    "plugin_airblade_vim-rooter" = { url = "github:airblade/vim-rooter"; flake = false; };
    "plugin_nvim-tree_nvim-tree.lua" = { url = "github:nvim-tree/nvim-tree.lua"; flake = false; };
    "plugin_tpope_vim-sleuth" = { url = "github:tpope/vim-sleuth"; flake = false; };

    "plugin_jamessan_vim-gnupg" = { url = "github:jamessan/vim-gnupg"; flake = false; };
    "plugin_NTBBloodbath_rest.nvim" = { url = "github:NTBBloodbath/rest.nvim"; flake = false; };
    "plugin_leafOfTree_vim-vue-plugin" = { url = "github:leafOfTree/vim-vue-plugin"; flake = false; };
    "plugin_tyru_open-browser.vim" = { url = "github:tyru/open-browser.vim"; flake = false; };

    "plugin_bfredl_nvim-luadev" = { url = "github:bfredl/nvim-luadev"; flake = false; };
    "plugin_mfussenegger_nvim-dap" = { url = "github:mfussenegger/nvim-dap"; flake = false; };
    "plugin_theHamsta_nvim-dap-virtual-text" = { url = "github:theHamsta/nvim-dap-virtual-text"; flake = false; };
    "plugin_rcarriga_nvim-dap-ui" = { url = "github:rcarriga/nvim-dap-ui"; flake = false; };
    "plugin_nvim-telescope_telescope-dap.nvim" = { url = "github:nvim-telescope/telescope-dap.nvim"; flake = false; };

    "plugin_akinsho_toggleterm.nvim" = { url = "github:akinsho/toggleterm.nvim"; flake = false; };

    "plugin_stevearc_dressing.nvim" = { url = "github:stevearc/dressing.nvim"; flake = false; };
    "plugin_folke_zen-mode.nvim" = { url = "github:folke/zen-mode.nvim"; flake = false; };
    "plugin_nvim-lualine_lualine.nvim" = { url = "github:nvim-lualine/lualine.nvim"; flake = false; };
    "plugin_folke_which-key.nvim" = { url = "github:folke/which-key.nvim"; flake = false; };
    "plugin_luukvbaal_stabilize.nvim" = { url = "github:luukvbaal/stabilize.nvim"; flake = false; };
    "plugin_glepnir_dashboard-nvim" = { url = "github:glepnir/dashboard-nvim"; flake = false; };

    "plugin_norcalli_nvim-colorizer.lua" = { url = "github:norcalli/nvim-colorizer.lua"; flake = false; };
    "plugin_rktjmp_lush.nvim" = { url = "github:rktjmp/lush.nvim"; flake = false; };
    "plugin_mcchrish_zenbones.nvim" = { url = "github:mcchrish/zenbones.nvim"; flake = false; };
    "plugin_Mofiqul_adwaita.nvim" = { url = "github:Mofiqul/adwaita.nvim"; flake = false; };

    "plugin_MunifTanjim_nui.nvim" = { url = "github:MunifTanjim/nui.nvim"; flake = false; };
    "plugin_folke_noice.nvim" = { url = "github:folke/noice.nvim"; flake = false; };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, flake-utils, ... } @ inputs:
    flake-utils.lib.eachDefaultSystem (system:
      let
        # Once we add this overlay to our nixpkgs, we are able to
        # use `pkgs.neovimPlugins`, which is a map of our plugins.
        # Each input in the format:
        # ```
        # "plugin_yourPluginName" = {
        #   url   = "github:exampleAuthor/examplePlugin";
        #   flake = false;
        # };
        # ```
        # included in the `inputs` section is packaged to a (neo-)vim
        # plugin and can then be used via
        # ```
        # pkgs.neovimPlugins.yourPluginName
        # ```
        pluginOverlay = final: prev:
          let
            inherit (prev.vimUtils) buildVimPluginFrom2Nix;
            plugins = builtins.filter
              (s: (builtins.match "plugin_.*" s) != null)
              (builtins.attrNames inputs);
            plugName = input:
              builtins.substring
                (builtins.stringLength "plugin_")
                (builtins.stringLength input)
                input;
            buildPlug = name: buildVimPluginFrom2Nix {
              pname = plugName name;
              version = "master";
              src = builtins.getAttr name inputs;
            };
          in
          {
            neovimPlugins = builtins.listToAttrs (map
              (plugin: {
                name = plugName plugin;
                value = buildPlug plugin;
              })
              plugins);
          };

        # Apply the overlay and load nixpkgs as `pkgs`
        pkgs = import nixpkgs
          {
            inherit system;
            overlays = [
              pluginOverlay
              (final: prev: {
                neovim-unwrapped = inputs.neovim-flake.packages.${prev.system}.neovim;
                java-debug = final.stdenv.mkDerivation
                  {
                    name = "java-debug";
                    src = inputs.java-debug-bin;
                    installPhase = ''
                      mkdir -p $out/lib
                      ls -la
                      cp -rv ./com.microsoft.java.debug.plugin $out/lib/
                    '';
                  };
              })
            ];
          };

        pkgs-unstable = import nixpkgs-unstable {
          inherit system;
        };

        neovimBuilder = { customRC, dependencies }:
          let
            neovimUnwrapped = pkgs.neovim-unwrapped.overrideAttrs (oldAttrs: {
              /* patches = (oldAttrs.patches or [ ]) ++ [ ./nvim-no-mod-time-check-on-write.patch ]; */
            });

            neovim-wrapped = pkgs.wrapNeovim neovimUnwrapped {
              viAlias = true;
              vimAlias = true;
              configure = {
                customRC = customRC;
                packages.myVimPackage = with pkgs.neovimPlugins; {
                  start =
                    builtins.attrValues pkgs.neovimPlugins ++
                    [
                      (pkgs-unstable.vimPlugins.nvim-treesitter.withPlugins (_:
                        pkgs-unstable.tree-sitter.allGrammars))
                    ];
                };
              };
              extraMakeWrapperArgs = "--prefix PATH : ${pkgs.lib.makeBinPath dependencies} --set JAVA_DEBUG_JAR '${pkgs.java-debug}/lib/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-0.40.0.jar'";
            };

            neovim-jailed = pkgs.symlinkJoin {
              name = "neovim";
              paths = [ neovim-wrapped ];
              postBuild =
                let firejail-args = ''
                  --quiet \
                  --tracelog \
                  --noblacklist=\$HOME/.gitconfig \
                  --noblacklist=\$HOME/.config/git \
                  --noblacklist=/run/user/$(id -u) \
                  --whitelist=/run/user/$(id -u)/wayland-1 \
                  --deterministic-exit-code \
                  --deterministic-shutdown \
                '';
                in
                ''
                  mv $out/bin/nvim $out/bin/nvim-unjailed

                  cat << _EOF > $out/bin/nvim
                  #! ${pkgs.runtimeShell} -e
                  exec /run/wrappers/bin/firejail \
                    ${firejail-args} -- \
                    ${neovim-wrapped}/bin/nvim "\$@"
                  _EOF
                  chmod 0755 $out/bin/nvim

                  cat << _EOF > $out/bin/nvim-net
                  #! ${pkgs.runtimeShell} -e
                  exec /run/wrappers/bin/firejail \
                    --ignore=net \
                    ${firejail-args} -- \
                    ${neovim-wrapped}/bin/nvim "\$@"
                  _EOF
                  chmod 0755 $out/bin/nvim-net
                '';
            };

          in
          neovim-jailed;

      in
      rec {
        apps.default = apps.nvim;
        packages.default = packages.neovim;

        apps.nvim = {
          type = "app";
          program = "${packages.default}/bin/nvim";
        };

        packages.neovim = neovimBuilder {
          customRC = ''
            set rtp+=${./.}/config
            runtime init.lua
          '';
          dependencies = with pkgs; [
            # Telescope
            fd
            ripgrep
            bat

            # Language servers

            # Bash
            nodePackages.bash-language-server

            # Docker
            nodePackages.dockerfile-language-server-nodejs

            # JavaScript / Typescript / JSON
            nodejs_latest
            nodePackages.typescript-language-server
            nodePackages.vscode-json-languageserver
            nodePackages.eslint_d
            nodePackages.prettier

            # HTML / CSS
            nodePackages.vscode-html-languageserver-bin
            nodePackages.vscode-css-languageserver-bin

            # Tailwind
            nodePackages."@tailwindcss/language-server"

            # Vue VLS Vetur
            nodePackages.vls

            # GraphQL (not in stable yet 22.05)
            pkgs-unstable.nodePackages.graphql-language-service-cli

            # NIX
            rnix-lsp

            # Python (setup lsp in neovim)
            /* python39Packages.jedi-language-server */

            # Java
            pkgs-unstable.jdt-language-server

            # Lua
            sumneko-lua-language-server
            stylua

            # Vim
            nodePackages.vim-language-server

            # YAML
            nodePackages.yaml-language-server

            # Spelling and grammar
            languagetool
          ];
        };
      }
    );
}
