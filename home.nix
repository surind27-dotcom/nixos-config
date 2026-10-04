
{ pkgs, ... }:

{
  # home.username и home.homeDirectory НЕ указываем —
  # NixOS-модуль подставит их из configuration.nix
  imports = [
  ./modules/kitty.nix
  ];

  home.stateVersion = "26.05";

  # Пользовательские пакеты (можно перенести часть из configuration.nix)
  home.packages = with pkgs; [
    # например, если хочешь что-то только для себя, а не для всей системы:
    # vesktop
  ];

  programs.bash.enableCompletion = true;
  # Настройки программ
  /*
    programs.kitty = {
    enable = true;

    # 1. Настройки шрифта выносим в отдельную опцию font
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 12;
    };

    # 2. В settings оставляем только простые (плоские) параметры
    settings = {
      background_opacity = "0.85";
      dynamic_background_opacity = true;
     # background_blur = 2;
      live_config_reload = true;
      confirm_os_window_close = 0;
    };

    # 3. Подключение темы Noctalia и другие нестандартные настройки — через extraConfig
    extraConfig = ''
      include ~/.config/kitty/themes/noctalia.conf
    '';
  };*/
/* 
  programs.alacritty = {
    enable = true;
    settings = {
      general = {
            import = [ "~/.config/alacritty/themes/noctalia.toml" ];
            live_config_reload = true;
          };
      window = {
      opacity = 0.85;
      };
      font = {
        size = 12;
        normal = {
          family = "JetBrainsMono Nerd Font";
          style = "Regular";
        };
        bold = {
          family = "JetBrainsMono Nerd Font";
          style = "Bold";
        };
        italic = {
          family = "JetBrainsMono Nerd Font";
          style = "Italic";
        };
        bold_italic = {
          family = "JetBrainsMono Nerd Font";
          style = "Bold Italic";
        };
      };
    };
  };

  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "JetBrainsMono Nerd Font:size=12";
        lines = 5;
        auto-select = true;
      };
      colors = {
        background = "2E3440ff";
        text = "D8DEE9ff";
        selection = "434C5Eff";
        selection-text = "D8DEE9ff";
        border = "81A1C1ff";
        selection-match = "88C0D0ff";
      };
      border = {
        radius = 4;
        width = 1;
      };
    };
  };
*/
  programs.fastfetch = {
    enable = true;
    settings = {
      modules = [
        "title"
        "separator"
        "os"
        "kernel"
        "uptime"
        "packages"
        "shell"
        "de"
        "wm"
        "terminal"
        "cpu"
        "gpu"
        "memory"
        "break"
        "colors"
      ];
    };
  };

 home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 24;
  };

  # Настройки GTK — это ОТДЕЛЬНЫЙ блок, не внутри pointerCursor!
  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark"; # или ваша тема
      package = pkgs.adwaita-icon-theme;
    };
  };
}
