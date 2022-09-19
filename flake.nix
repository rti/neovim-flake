{
  description = "rti Neovim, based on Luca's simple Neovim flake";

  inputs = {
    /* nixpkgs.url = "nixpkgs/release-22.05"; */
    nixpkgs.url = "nixpkgs/nixos-unstable";
    flake-utils = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:numtide/flake-utils";
    };

    neovim-flake = {
      url = "github:neovim/neovim/release-0.7?dir=contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    "plugin:onedark-vim" = { url = "github:joshdick/onedark.vim"; flake = false; };
    /* "plugin:which-key" =   { url = "github:folke/which-key.nvim"; flake = false; }; */

    "plugin:nvim-lua_popup.nvim" = { url = "github:nvim-lua/popup.nvim"; flake = false; };
    "plugin:nvim-lua_plenary.nvim" = { url = "github:nvim-lua/plenary.nvim"; flake = false; };

    "plugin:kyazdani42_nvim-web-devicons" = { url = "github:kyazdani42/nvim-web-devicons"; flake = false; };

    /* "plugin:nvim-treesitter_nvim-treesitter" = { url = "github:nvim-treesitter/nvim-treesitter"; flake = false; }; */
    "plugin:nvim-treesitter_nvim-treesitter-textobjects" = { url = "github:nvim-treesitter/nvim-treesitter-textobjects"; flake = false; };
    "plugin:JoosepAlviste_nvim-ts-context-commentstring" = { url = "github:JoosepAlviste/nvim-ts-context-commentstring"; flake = false; };
    "plugin:windwp_nvim-ts-autotag" = { url = "github:windwp/nvim-ts-autotag"; flake = false; };
    "plugin:p00f_nvim-ts-rainbow" = { url = "github:p00f/nvim-ts-rainbow"; flake = false; };

    "plugin:neovim_nvim-lspconfig" = { url = "github:neovim/nvim-lspconfig"; flake = false; };
    "plugin:jose-elias-alvarez_null-ls.nvim" = { url = "github:jose-elias-alvarez/null-ls.nvim"; flake = false; };
    "plugin:j-hui_fidget.nvim" = { url = "github:j-hui/fidget.nvim"; flake = false; };
    "plugin:mfussenegger_nvim-jdtls" = { url = "github:mfussenegger/nvim-jdtls"; flake = false; };
    "plugin:SmiteshP_nvim-gps" = { url = "github:SmiteshP/nvim-gps"; flake = false; };
    "plugin:simrat39_symbols-outline.nvim" = { url = "github:simrat39/symbols-outline.nvim"; flake = false; };
    "plugin:kosayoda_nvim-lightbulb" = { url = "github:kosayoda/nvim-lightbulb"; flake = false; };
    "plugin:weilbith_nvim-code-action-menu" = { url = "github:weilbith/nvim-code-action-menu"; flake = false; };
    "plugin:ray-x_lsp_signature.nvim" = { url = "github:ray-x/lsp_signature.nvim"; flake = false; };

    "plugin:hrsh7th_nvim-cmp" = { url = "github:hrsh7th/nvim-cmp"; flake = false; };
    "plugin:hrsh7th_cmp-path" = { url = "github:hrsh7th/cmp-path"; flake = false; };
    "plugin:hrsh7th_cmp-cmdline" = { url = "github:hrsh7th/cmp-cmdline"; flake = false; };
    "plugin:hrsh7th_cmp-nvim-lsp" = { url = "github:hrsh7th/cmp-nvim-lsp"; flake = false; };
    "plugin:hrsh7th_cmp-nvim-lsp-signature-help" = { url = "github:hrsh7th/cmp-nvim-lsp-signature-help"; flake = false; };
    "plugin:hrsh7th_cmp-buffer" = { url = "github:hrsh7th/cmp-buffer"; flake = false; };
    "plugin:hrsh7th_cmp-vsnip" = { url = "github:hrsh7th/cmp-vsnip"; flake = false; };
    "plugin:hrsh7th_vim-vsnip" = { url = "github:hrsh7th/vim-vsnip"; flake = false; };
    "plugin:rafamadriz_friendly-snippets" = { url = "github:rafamadriz/friendly-snippets"; flake = false; };
    "plugin:windwp_nvim-autopairs" = { url = "github:windwp/nvim-autopairs"; flake = false; };

    "plugin:nvim-telescope_telescope.nvim" = { url = "github:nvim-telescope/telescope.nvim"; flake = false; };

    "plugin:tpope_vim-surround" = { url = "github:tpope/vim-surround"; flake = false; };
    "plugin:tpope_vim-speeddating" = { url = "github:tpope/vim-speeddating"; flake = false; };
    "plugin:tpope_vim-repeat" = { url = "github:tpope/vim-repeat"; flake = false; };
    "plugin:tpope_vim-commentary" = { url = "github:tpope/vim-commentary"; flake = false; };

    "plugin:tpope_vim-fugitive" = { url = "github:tpope/vim-fugitive"; flake = false; };
    "plugin:lewis6991_gitsigns.nvim" = { url = "github:lewis6991/gitsigns.nvim"; flake = false; };
    "plugin:sindrets_diffview.nvim" = { url = "github:sindrets/diffview.nvim"; flake = false; };

    "plugin:bkad_CamelCaseMotion" = { url = "github:bkad/CamelCaseMotion"; flake = false; };
    "plugin:famiu_bufdelete.nvim" = { url = "github:famiu/bufdelete.nvim"; flake = false; };

    "plugin:sbdchd_neoformat" = { url = "github:sbdchd/neoformat"; flake = false; };

    "plugin:Pocco81_auto-save.nvim" = { url = "github:Pocco81/auto-save.nvim"; flake = false; };
    "plugin:airblade_vim-rooter" = { url = "github:airblade/vim-rooter"; flake = false; };
    "plugin:kyazdani42_nvim-tree.lua" = { url = "github:kyazdani42/nvim-tree.lua"; flake = false; };
    "plugin:tpope_vim-sleuth" = { url = "github:tpope/vim-sleuth"; flake = false; };

    "plugin:jamessan_vim-gnupg" = { url = "github:jamessan/vim-gnupg"; flake = false; };
    "plugin:NTBBloodbath_rest.nvim" = { url = "github:NTBBloodbath/rest.nvim"; flake = false; };
    "plugin:leafOfTree_vim-vue-plugin" = { url = "github:leafOfTree/vim-vue-plugin"; flake = false; };
    "plugin:tyru_open-browser.vim" = { url = "github:tyru/open-browser.vim"; flake = false; };

    "plugin:bfredl_nvim-luadev" = { url = "github:bfredl/nvim-luadev"; flake = false; };
    "plugin:mfussenegger_nvim-dap" = { url = "github:mfussenegger/nvim-dap"; flake = false; };
    "plugin:theHamsta_nvim-dap-virtual-text" = { url = "github:theHamsta/nvim-dap-virtual-text"; flake = false; };
    "plugin:rcarriga_nvim-dap-ui" = { url = "github:rcarriga/nvim-dap-ui"; flake = false; };
    "plugin:nvim-telescope_telescope-dap.nvim" = { url = "github:nvim-telescope/telescope-dap.nvim"; flake = false; };

    "plugin:akinsho_toggleterm.nvim" = { url = "github:akinsho/toggleterm.nvim"; flake = false; };

    "plugin:stevearc_dressing.nvim" = { url = "github:stevearc/dressing.nvim"; flake = false; };
    "plugin:folke_zen-mode.nvim" = { url = "github:folke/zen-mode.nvim"; flake = false; };
    "plugin:nvim-lualine_lualine.nvim" = { url = "github:nvim-lualine/lualine.nvim"; flake = false; };
    "plugin:folke_which-key.nvim" = { url = "github:folke/which-key.nvim"; flake = false; };
    "plugin:luukvbaal_stabilize.nvim" = { url = "github:luukvbaal/stabilize.nvim"; flake = false; };
    "plugin:glepnir_dashboard-nvim" = { url = "github:glepnir/dashboard-nvim"; flake = false; };

    "plugin:norcalli_nvim-colorizer.lua" = { url = "github:norcalli/nvim-colorizer.lua"; flake = false; };
    "plugin:rktjmp_lush.nvim" = { url = "github:rktjmp/lush.nvim"; flake = false; };
    "plugin:mcchrish_zenbones.nvim" = { url = "github:mcchrish/zenbones.nvim"; flake = false; };
    "plugin:Mofiqul_adwaita.nvim" = { url = "github:Mofiqul/adwaita.nvim"; flake = false; };
  };

  outputs = { self, nixpkgs, flake-utils, ... }@inputs:
    flake-utils.lib.eachDefaultSystem (system:
      let
        # Once we add this overlay to our nixpkgs, we are able to
        # use `pkgs.neovimPlugins`, which is a map of our plugins.
        # Each input in the format:
        # ```
        # "plugin:yourPluginName" = {
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
            # treesitterGrammars = prev.tree-sitter.withPlugins (_: prev.tree-sitter.allGrammars);
            plugins = builtins.filter
              (s: (builtins.match "plugin:.*" s) != null)
              (builtins.attrNames inputs);
            plugName = input:
              builtins.substring
                (builtins.stringLength "plugin:")
                (builtins.stringLength input)
                input;
            buildPlug = name: buildVimPluginFrom2Nix {
              pname = plugName name;
              version = "master";
              src = builtins.getAttr name inputs;

              # Tree-sitter fails for a variety of lang grammars unless using :TSUpdate
              # For now install imperatively
              #postPatch =
              #  if (name == "nvim-treesitter") then ''
              #    rm -r parser
              #    ln -s ${treesitterGrammars} parser
              #  '' else "";
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
        pkgs = import nixpkgs {
          inherit system;
          overlays = [
            pluginOverlay
            (final: prev: {
              neovim-unwrapped = inputs.neovim-flake.packages.${prev.system}.neovim;
            })
          ];
        };

        # neovimBuilder is a function that takes your prefered
        # configuration as input and just returns a version of
        # neovim where the default config was overwritten with your
        # config.
        #
        # Parameters:
        # customRC | your init.vim as string
        # start    | The set of plugins to load on every startup
        #          | The list is in the form ["yourPluginName" "anotherPluginYouLike"];
        #          |
        #          | Important: The default is to load all plugins, if
        #          |            `start = [ "blabla" "blablabla" ]` is
        #          |            not passed as an argument to neovimBuilder!
        #          |
        #          | Make sure to add:
        #          | ```
        #          | "plugin:yourPluginName" = {
        #          |   url   = "github:exampleAuthor/examplePlugin";
        #          |   flake = false;
        #          | };
        #          |
        #          | "plugin:anotherPluginYouLike" = {
        #          |   url   = "github:exampleAuthor/examplePlugin";
        #          |   flake = false;
        #          | };
        #          | ```
        #          | to your imports!
        # opt      | List of optional plugins to load only when
        #          | explicitly loaded from inside neovim
        neovimBuilder = { 
          customRC  ? "", 
          start     ? builtins.attrValues pkgs.neovimPlugins, 
          opt       ? [], 
          debug     ? false, 
          depencies ? []}:
            let
            neovimUnwrapped = pkgs.neovim-unwrapped.overrideAttrs (prev: {
              /* # TODO find out why this is here */
              /* propagatedBuildInputs = with pkgs; [ pkgs.stdenv.cc.cc.lib ]; */
              patches = (prev.patches or []) ++ [ ./nvim-no-mod-time-check-on-write.patch ];
            });

            neovim-wrapped = pkgs.wrapNeovim neovimUnwrapped {
              viAlias = true;
              vimAlias = true;
              configure = {
                customRC = customRC;
                packages.myVimPackage = with pkgs.neovimPlugins; {
                  /* start = start; */
                  start = start ++ [ 
                    (pkgs.vimPlugins.nvim-treesitter.withPlugins (_: pkgs.tree-sitter.allGrammars)) ];
                  opt = opt;
                };
              };
            };

            neovim-withDeps = pkgs.symlinkJoin {
              name = "neovim";
              paths = with pkgs; [ neovim-wrapped ] ++ depencies;
              nativeBuildInputs = [ pkgs.makeWrapper ];
              postBuild = ''
                wrapProgram $out/bin/nvim \
                --prefix PATH : $out/bin \
                --set JAVA_HOME ${pkgs.jdk11}
              '';
            };

            in
              neovim-withDeps;

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
          start = (builtins.attrValues pkgs.neovimPlugins);
          depencies = with pkgs; [
            # Telescope
            fd
            ripgrep
            bat

            # Treesitter
            /* gcc */

            # Language servers

            # JavaScript / Typescript
            nodePackages.typescript-language-server
            # NIX
            rnix-lsp

            # Python
            python39Packages.jedi-language-server

            # Java
            jdk11
            java-language-server

            # Lua
            sumneko-lua-language-server

            # Spelling and grammar
            languagetool
          ];
        };
      }
    );
}
