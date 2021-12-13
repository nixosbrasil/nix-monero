{
  description = ''A collection of Nix packages and NixOS modules for easily 
installing full-featured Monero nodes with an emphasis on ease of use.'';

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, ... }@inputs:
    let
      mkPkgs = { system }:
        import inputs.nixpkgs {
          inherit system;
        };

      mkHost = { system, host }:
        let
          pkgs = mkPkgs { inherit system; };
        in
        inputs.nixpkgs.lib.nixosSystem {
          inherit system;

          specialArgs = {
            inherit pkgs inputs;
          };

          modules = [
            (./nixosConfigurations + "/${host}.nix")
          ];
        };
    in
    {
      nixosConfigurations = {
        liveusb = mkHost {
          system = "x86_64-linux";
          host = "liveusb";
        };
      };
    };
}
