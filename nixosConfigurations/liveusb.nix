{ pkgs, inputs, ... }:

{
  imports = [
    "${inputs.nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix"
  ];

#   boot.kernelParams = [
#     "nr.hugepagesz=1G"
#     "nr.hugepages=10"
#   ];

#   services.xmrig = {
#     enable = true;
#     settings = {
#       "autosave" = true;
#       "cpu" = true;
#       "opencl" = false;
#       "cuda" = false;
#       "1gb-pages" = true;
#       "pools" = [
#         {
#           "coin" = "monero";
#           "url" = "xmr-us-west1.nanopool.org:14433";
#           "user" = "888tNkZrPN6JsEgekjMnABU4TBzc2Dt29EPAvkRxbANsAnjyPbb3iQ1YBRk1UXcdRsiKc9dhwMVgN5S9cQUiyoogDavup3H";
#           "tls" = true;
#         }
#       ];
#     };
#   };

  users.users.local = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    password = "changeme";
  };
}
