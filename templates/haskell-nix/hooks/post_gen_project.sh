#!/usr/bin/env bash

# We do it file by file to avoid "chmod -R"ing
# unexpected paths if something goes wrong in cookiecutter

chmod +w Main.hs
chmod +w flake.nix
chmod +w package.nix
chmod +w systems.nix
chmod +w treefmt.nix
chmod +w '{{cookiecutter.binaryName}}.cabal'
