{pkgs}: let
  pkg = pkgs.haskellPackages.developPackage {
    root =
      pkgs.nix-gitignore.gitignoreSourcePure
      [
        "dist-newstyle"
        ".*#"
        ".git"
      ]
      ./.;
    returnShellEnv = false;
  };
in
  pkgs.haskellPackages.generateOptparseApplicativeCompletions ["{{cookiecutter.binaryName}}"] pkg
