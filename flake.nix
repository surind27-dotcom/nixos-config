{
  description = "NixOS configuration with zapret-discord-youtube";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05"; # Укажите свою версию NixOS, но не ниже 25.11.
    zapret-discord-youtube.url = "github:kartavkun/zapret-discord-youtube";
  };

  outputs = { self, nixpkgs, zapret-discord-youtube }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix

        zapret-discord-youtube.nixosModules.withTestTools
        {
          services.zapret-discord-youtube = {
            enable = true;
            configName = "general(ALT)";  # Или любой конфиг из папки configs (general, general(ALT), general (SIMPLE FAKE) и т.д.)

            # Game Filter: "null" (отключен), "all" (TCP+UDP), "tcp" (только TCP), "udp" (только UDP)
            gameFilter = "udp";  # или "all", "tcp", "udp"

            # Добавляем кастомные домены в list-general-user.txt
            listGeneral = [ "example.com" "test.org" "telegram.org" ];

            # Добавляем домены в list-exclude-user.txt (исключения)
            listExclude = [ "ubisoft.com" "origin.com" ];

            # Добавляем IP адреса в ipset-all.txt
            ipsetAll = [ "192.168.1.0/24" "10.0.0.1" ];

            # Добавляем IP адреса в ipset-exclude-user.txt (исключения)
            ipsetExclude = [ "203.0.113.0/24" ];

            # Необязательно: пользовательские hostlists и конфиги.
            # extraHostlists может содержать несколько файлов.
            # Если нужен пример для GitHub, раскомментируйте блок ниже
            # и оставьте в configName выбранный вами готовый конфиг.
            #
            # extraHostlists."list-github.txt" = [
            #   "github.com"
            #   "api.github.com"
            #   "raw.githubusercontent.com"
            #   "objects.githubusercontent.com"
            #   "githubusercontent.com"
            #   "githubassets.com"
            # ];
            #
            # extraHostlists."list-custom.txt" = [
            #   "example.com"
            #   "example.org"
            # ];
            #
            # nfqwsAppend = [
            #   ''--filter-tcp=443 --hostlist="/opt/zapret/hostlists/list-github.txt" --dpi-desync=multisplit --dpi-desync-split-pos=2''
            # ];
            #
            # Для полностью ручного конфига можно создать отдельный файл:
            # extraConfigs."my-custom-config" = ''
            #   NFQWS_ENABLE=1
            #   NFQWS_OPT="
            #   --filter-tcp=443 --hostlist="/opt/zapret/hostlists/list-github.txt" --dpi-desync=multisplit --dpi-desync-split-pos=2
            #   "
            # '';
          };
        }
      ];
    };
  };
}
