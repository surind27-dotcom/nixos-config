{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;

    font = {
      name = "JetBrainsMono Nerd Font";
      size = 12;
    };

    settings = {
      background_opacity = "0.85";
      dynamic_background_opacity = true;
      live_config_reload = true;
      confirm_os_window_close = 0;
    };

    extraConfig = ''
      include ~/.config/kitty/themes/noctalia.conf
    '';
  };
}
