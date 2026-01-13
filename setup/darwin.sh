#!/usr/bin/env bash

xcode-select --install
sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install)
