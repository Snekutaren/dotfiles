#!bin/bash
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko #/tmp/flake/nixrog-disko-config.nix
#sudo cryptsetup luksAddKey /dev/disk/by-label/NIXOS_LUKS
#sudo nixos-generate-config --no-filesystems --root /mnt
sudo nixos-install --root /mnt --flake ./flake.nix -v #/tmp/flake#nixrog