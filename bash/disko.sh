#!bin/bash
mkdir -p  /tmp/nixos-config
git clone -b auto https://github.com/snekutaren/nixos-config.git /tmp/nixos-config
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko /tmp/nixos-config/qemu-disko.nix
#sudo cryptsetup luksAddKey /dev/disk/by-label/NIXOS_LUKS
#sudo nixos-generate-config --no-filesystems --root /mnt
sudo nixos-install --root /mnt --flake ./flake.nix -v /tmp/nixos-config/flake#qemu