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
    name = "Nordic";
    package = pkgs.nordic;
  };
  iconTheme = {
    name = "Papirus-Dark";
    package = pkgs.papirus-icon-theme;
  };
};

home.packages = with pkgs; [
  nordic
  papirus-icon-theme
];
}
