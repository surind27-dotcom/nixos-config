{ pkgs, ... }:

{
  # aliases
  environment.shellAliases = {
    nixup = "sudo nixos-rebuild switch --flake /etc/nixos/#nixos";
    nixsave = "cd /etc/nixos && sudo git add -A && sudo git commit -m 'Auto-save' && sudo git push; cd ~";
    nixclear = "sudo nix-collect-garbage -d";
    nixgens = "sudo nixos-rebuild list-generations";
    nixupdate = "cd /etc/nixos && sudo nix flake update && sudo nixos-rebuild switch --flake .#nixos";
        # Обновление по одному input'у
    nixup-pkgs    = "cd /etc/nixos && sudo nix flake update nixpkgs && sudo nixos-rebuild switch --flake .#nixos";
    nixup-hm      = "cd /etc/nixos && sudo nix flake update home-manager && sudo nixos-rebuild switch --flake .#nixos";
#    nixup-drift   = "cd /etc/nixos && sudo nix flake update driftwm && sudo nixos-rebuild switch --flake .#nixos";
    nixup-zapret  = "cd /etc/nixos && sudo nix flake update zapret-discord-youtube && sudo nixos-rebuild switch --flake .#nixos";

    # Управление zapret
    zaps = "sudo systemctl status zapret-discord-youtube";       # status
    zapr = "sudo systemctl restart zapret-discord-youtube";      # restart
    zapstop = "sudo systemctl stop zapret-discord-youtube";      # stop
    zapstart = "sudo systemctl start zapret-discord-youtube";    # start
    zaplog = "sudo journalctl -u zapret-discord-youtube -f";     # live log
  };
}
