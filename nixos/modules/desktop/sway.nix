# nixos/modules/desktop/sway.nix
{ config, lib, pkgs, ... }:

with lib;

{
  config.environment.systemPackages = with pkgs; [
    sway
    foot
    waybar
    grim
    slurp
    swayidle
  ] ++ config.environment.systemPackages;
}
