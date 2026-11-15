{ pkgs, ... }:

{
  services.minecraft-server = {
    enable = true;
    eula = true; 
    openFirewall = true; 

    declarative = true; 

    serverProperties = {
      online-mode = false; 

      server-port = 25565;
      difficulty = 2; # 0 - peaceful, 1 - easy, 2 - normal, 3 - hard
      gamemode = 0;   # 0 - survival, 1 - creative
      max-players = 10;
      motd = "NixOS Server (Pirate Friendly)";
      
      white-list = false; 
    };

    jvmOpts = "-Xms2048M -Xmx4096M"; 
  };
}
