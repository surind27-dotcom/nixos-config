{ pkgs, ... }:

{
  services.minecraft-server = {
    enable = true;
    eula = true; # Подтверждает согласие с лицензией
    openFirewall = true; # Открывает порт (по умолчанию 25565)

    # Включаем декларативный режим, чтобы serverProperties работали
    declarative = true; 

    serverProperties = {
      # 👇 Эта строчка разрешает вход пиратским клиентам
      online-mode = false; 

      # Остальные настройки по вкусу
      server-port = 25565;
      difficulty = 2; # 0 - peaceful, 1 - easy, 2 - normal, 3 - hard
      gamemode = 0;   # 0 - survival, 1 - creative
      max-players = 10;
      motd = "NixOS Server (Pirate Friendly)";
      
      # Можно отключить белый список, если хочешь пускать всех
      white-list = false; 
    };

    # Параметры для выделения оперативной памяти
    jvmOpts = "-Xms2048M -Xmx4096M"; 
  };
}
