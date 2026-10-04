
{ pkgs, ... }:

{
  # home.username и home.homeDirectory НЕ указываем —
  # NixOS-модуль подставит их из configuration.nix
  imports = [
  ./modules/home/kitty.nix
  ./modules/home/fastfetch.nix
  ./modules/home/pointer.nix
  ./modules/home/yazi.nix
  ./modules/home/bash.nix
  ];

  home.stateVersion = "26.05";

  home.packages = with pkgs; [
  ];
  programs.bash.enableCompletion = true;
}
