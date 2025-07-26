#!/usr/bin/env bash

# We don't use relative values here to avoid "chmod -R"ing
# unexpected paths if something goes wrong in cookiecutter

chmod +w .gitignore
chmod +w default.nix
chmod +w cabal.project
chmod +w LICENSE
chmod +w '{{cookiecutter.binaryName}}.cabal'

