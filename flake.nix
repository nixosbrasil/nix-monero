{
  description = ''A collection of Nix packages and NixOS modules for easily 
installing full-featured Monero nodes with an emphasis on ease of use.'';

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, utils }:
    utils.lib.eachDefaultSystem
      (system:
        let pkgs = import nixpkgs {
          inherit system;
          overlay = ./overlay.nix;
        };
        in
        {
          packages = import ./packages { inherit pkgs; };
        }) // {
      overlay = import ./overlay.nix;
    };
}

