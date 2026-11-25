{
  niceHaskell,
  doCheck ? false,
  doBenchmark ? false,
}:
niceHaskell.mkPackage {
  src = ../.;
  inherit doCheck doBenchmark;
}
