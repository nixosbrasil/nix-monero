{ config, lib, pkgs, inputs, ... }:

let
  inherit (inputs) nixpkgs;
  inherit (pkgs) xmrig xmrig-mo;
in
{
  imports = [
    "${nixpkgs}/nixos/modules/installer/cd-dvd/iso-image.nix"
    "${nixpkgs}/nixos/modules/profiles/all-hardware.nix"
    "${nixpkgs}/nixos/modules/profiles/base.nix"
  ];

  isoImage = {
    makeEfiBootable = true;
    makeUsbBootable = true;
    isoName = "xmrig-liveusb.iso";
  };

  networking = {
    hostName = "miner";
    networkmanager.enable = true;
  };

  users.users.local = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    password = "changeme";
  };

  services.xmrig = {
    enable = true;
    # change 'xmrig' to 'xmrig-mo' to use monero ocean's fork
    package = xmrig;
    settings = builtins.fromJSON (builtins.readFile ./config.json);
  };
}
