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
  };
