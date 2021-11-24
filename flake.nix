{
  description = ''A collection of Nix packages and NixOS modules for easily 
installing full-featured Monero nodes with an emphasis on ease of use.'';

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, utils }: {};
}

