{ pkgs }:

let
  inherit (pkgs) callPackage;
in
{
  p2pool = callPackage ./p2pool { };

  # xmrig
  xmrig = callPackage ./xmrig/xmrig.nix { };
  xmrig-mo = callPackage ./xmrig/xmrig-mo.nix { };
  xmrig-proxy = callPackage ./xmrig/xmrig-proxy.nix { };
}
