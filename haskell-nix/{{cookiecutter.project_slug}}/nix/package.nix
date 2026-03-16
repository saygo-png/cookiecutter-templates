{niceHaskell, ...}:
niceHaskell.mkPackage {
  flags = niceHaskell.mkFlags {doCheck = false;};
  packageRoot = ./.;
  cabalName = "{{cookiecutter.binaryName}}";
  compiler = "ghc912";
}
