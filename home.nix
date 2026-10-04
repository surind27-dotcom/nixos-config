
{ pkgs, ... }:

{
  # home.username и home.homeDirectory НЕ указываем —
  # NixOS-модуль подставит их из configuration.nix
  imports = [
  ./modules/kitty.nix
  ./modules/fastfetch.nix
  ./modules/pointer.nix
  ];

  home.stateVersion = "26.05";

  home.packages = with pkgs; [
  ];
  programs.bash.enableCompletion = true;
}
