{pkgs,...}:
{ 
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
      package = pkgs.gnome-themes-extra;
    };
  };
}
