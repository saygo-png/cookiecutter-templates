{
  inputs = {
    treefmt-nix.url = "github:numtide/treefmt-nix";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    niceHaskell = {
      url = "github:saygo-png/nice-nixpkgs-haskell";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        systems.follows = "systems";
        treefmt-nix.follows = "treefmt-nix";
      };
    };
    systems = {
      url = "path:./nix/systems.nix";
      flake = false;
    };
  };

  outputs = {
    nixpkgs,
    systems,
    niceHaskell,
    treefmt-nix,
    self,
    ...
  }: let
    pkgsFor = nixpkgs.lib.genAttrs (import systems) (system: import nixpkgs {inherit system;});
    eachSystem = f: nixpkgs.lib.genAttrs (import systems) (system: f system pkgsFor.${system});
  in {
    packages = eachSystem (system: pkgs: let
      program = pkgs.callPackage ./nix/package.nix {niceHaskell = niceHaskell.outputs.niceHaskell.${system};};
    in {
      "{{cookiecutter.binary_name}}" = program;
      default = program;
    });

    checks = eachSystem (system: pkgs: {
      default = pkgs.callPackage ./nix/package.nix {
        niceHaskell = niceHaskell.outputs.niceHaskell.${system};
        doCheck = true;
        doBenchmark = true;
      };
    });

    formatter = eachSystem (_system: pkgs: (treefmt-nix.lib.evalModule pkgs ./nix/treefmt.nix).config.build.wrapper);

    devShells = eachSystem (system: pkgs: {
      default = pkgs.mkShell {
        inputsFrom = [self.checks.${system}.default.env];
        packages = [
          self.formatter.${system}
          pkgs.cabal-install
          pkgs.haskell-language-server
        ];
      };
    });
  };
}
