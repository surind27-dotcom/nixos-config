{pkgs,...}
{
 #aliases
  environment.shellAliases = {
  nixup = "sudo nixos-rebuild switch --flake /etc/nixos/#nixos";
  nixsave = "cd /etc/nixos && sudo git add -A && sudo git commit -m 'Auto-save' && sudo git >
  nixclear = "sudo nix-collect-garbage -d";
  nixgens = "sudo nixos-rebuild list-generations";
  nixupdate = "cd /etc/nixos && sudo nix flake update && sudo nixos-rebuild switch --flake .>
  # Управление zapret
  zaps = "sudo systemctl status zapret-discord-youtube";       # status
  zapr = "sudo systemctl restart zapret-discord-youtube";      # restart
  zapstop = "sudo systemctl stop zapret-discord-youtube";      # stop
  zapstart = "sudo systemctl start zapret-discord-youtube";    # start
  zaplog = "sudo journalctl -u zapret-discord-youtube -f";     # live log
};
}
