#!/usr/bin/env bash

# Since I put these templates in the nix store once copied they are not writeable.
# This adds write permissions after copy.
# We do it file by file to avoid "chmod -R"ing
# unexpected paths if something goes wrong in cookiecutter

chmod +w src/Main.hs
chmod +w flake.nix
chmod +w .envrc
chmod +w .gitignore
chmod +w nix/package.nix
chmod +w nix/systems.nix
chmod +w nix/treefmt.nix
chmod +w '{{cookiecutter.binaryName}}.cabal'
