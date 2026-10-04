#НЕ подключен в home.nix
{pkgs, ...}:
{ 
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
}
