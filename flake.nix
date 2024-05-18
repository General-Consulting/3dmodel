{
  description = "A flake for generating 3d models";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";


    flake-utils.url = "github:numtide/flake-utils";
    devshell.url = "github:numtide/devshell";
    mission-control.url = "github:General-Consulting/mission-control";
    flake-root.url = "github:srid/flake-root";

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, flake-utils, flake-parts, devshell, ... } @ inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {

      systems = nixpkgs.lib.systems.flakeExposed;
      imports = [
        inputs.devshell.flakeModule
      ];

      perSystem = { pkgs, system, self', inputs', lib, ... }:
        {

          _module.args.pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
          };

          devshells.default = {
            name = "General consulting 3d modeling";
            packages = with pkgs; [
              blender
              openscad-unstable
              openscad-lsp
              (vscode-with-extensions.override {
                vscode = vscode;
                vscodeExtensions = with vscode-extensions; [
                  jnoortheen.nix-ide
                  vscodevim.vim
                  yzhang.markdown-all-in-one
                  eamodio.gitlens
                  editorconfig.editorconfig
                  antyos.openscad
                ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [


                  {
                    name = "openscad-language-support";
                    publisher = "leathong";
                    version = "1.2.5";
                    sha256 = "sha256-/CLxBXXdUfYlT0RaGox1epHnyAUlDihX1LfT5wGd2J8=";
                  }
                  {
                    name = "autoclosetabs";
                    publisher = "Zwyx";
                    version = "1.1.2";
                    sha256 = "sha256-yZUAyBnGYFZQ7VXYsTfzF2rl6rAQ+DeZVC2FNMzw/uc=";
                  }
                  {
                    name = "deepdark-material";
                    publisher = "Nimda";
                    version = "3.3.1";
                    sha256 = "sha256-gc7B3h+r4UXO0WSVsscOa5nY4RRxG5XX3zrC1E1WJ3k=";
                  }
                  {
                    name = "copilot";
                    publisher = "Github";
                    version = "1.165.0";
                    sha256 = "sha256-8HvWb5zaoUdZ+BsAnW2TM20LqGwZshxgeJDEYKZOFgg=";
                  }
                  {
                    name = "back-n-forth";
                    publisher = "nick-rudenko";
                    version = "3.1.1";
                    sha256 = "sha256-yircrP2CjlTWd0thVYoOip/KPve24Ivr9f6HbJN0Haw=";
                  }
                  {
                    name = "smart-tabs";
                    publisher = "Valsorym";
                    version = "1.3.2";
                    sha256 = "sha256-RRL9DHQnZT64wIBvKC+f+6ga4kRptH98zpljfHc+Cu4=";
                  }
                ];
              })
            ];
          };
        };


    };
}
