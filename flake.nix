{
  description = "NixOS configuration with zapret-discord-youtube, driftwm and home-manager";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    zapret-discord-youtube.url = "github:kartavkun/zapret-discord-youtube";
    driftwm.url = "github:malbiruk/driftwm";  # <-- добавили driftwm
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, zapret-discord-youtube, driftwm, home-manager, ...}: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix

        # driftwm
        driftwm.nixosModules.default  # <-- модуль композитора

        # zapret
        zapret-discord-youtube.nixosModules.withTestTools
        {
          services.zapret-discord-youtube = {
            enable = true;
            configName = "general(ALT)";
            gameFilter = "all";
            listGeneral = [ "gnu.org" "discord.com" "telegram.org" "guix.gnu.org" "distrowatch.com" "exherbolinux.org" ];
            listExclude = [ "ubisoft.com" "origin.com" ];
            ipsetAll = [ "192.168.1.0/24" "10.0.0.1" ];
            ipsetExclude = [ "203.0.113.0/24" ];
          };
        }

        # home-manager
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.danil = import ./home.nix;
          home-manager.backupFileExtension = "backup";
        }
      ];
    };
  };
}
