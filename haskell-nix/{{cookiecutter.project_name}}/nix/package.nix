{niceHaskell, ...}:
niceHaskell.mkPackage {
  flags = niceHaskell.mkFlags {doCheck = false;};
  packageRoot = ../.;
  cabalName = "{{cookiecutter.binary_name}}";
  compiler = "ghc912";
}
