# NixOS XMRig Live USB

This directory contains the files needed to run a NixOS live usb to mine
[Monero](https://getmonero.org) with [XMRig](https://xmrig.com).

## Building

### GitHub Actions

You can make use of GitHub Actions to build the Operating System image.

1. Fork the repo
2. Replace the `config.json` file on this directory with your own.
3. Go to the Actions tab and select the **Build Live USB ISO**
4. Run the workflow

At the end of the workflow you should see the image as an artifact.

### Nix

1. Install [Nix](https://nixos.org/download.html)
2. Run `$ nix build --experimental-features 'nix-command flakes' .#nixosConfigurations.liveusb.config.system.build.isoImage`
3. Pick the image on `./result/iso/xmrig-liveusb.iso`
