<p align="center"> 
    <img height=80 src="assets/img/nix-monero.png">
</p>

---

**nix-monero** is a collection of Nix packages and NixOS modules for easily
installing full-featured [Monero][] nodes with an emphasis on ease of use. This 
project is _heavily inspired_ by the [nix-bitcoin][] project.

# Overview

This project currently has the focus on the mining space. Meaning that you can
leverage the power of Nix + NixOS to power your mining rigs in a reproducible
and declarative way.

Most of the packages and modules contained here are probably going to be 
available at the official [NixOS repository][] in the future. Consider this as a
fast way to iterate through issues and improvements.

[monero]: https://getmonero.org
[nix-bitcoin]: https://github.com/fort-nix/nix-bitcoin
[nixos repository]:  https://github.com/nixos/nixpkgs