#НЕ подключен в home.nix
{pkgs, ...}:
{ 
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
}
