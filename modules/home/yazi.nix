{ pkgs, ... }:

{
  programs.yazi = {
    enable = true;
    settings = {
      opener = {
        play = [
          {
            run = ''mpv --vo=kitty --vo-kitty-alt-screen=no "$@" ; reset'';
            block = true;
            orphan = false;
            for = "unix";
          }
        ];
        edit = [
          {
            run = ''$EDITOR "$@"'';
            block = true;
            for = "unix";
          }
        ];
        open = [
          {
            run = ''xdg-open "$@"'';
            orphan = true;
            for = "unix";
          }
        ];
      };

      open = {
        prepend_rules = [
          { mime = "video/*"; use = [ "play" "reveal" ]; }
          { mime = "image/*"; use = [ "open" "reveal" ]; }
          { mime = "text/*"; use = [ "edit" "reveal" ]; }
          { mime = "application/{zip,rar,7z*,tar,gzip,xz,zstd,bzip*,lzma,compress,archive,cpio,arj,xar,ms-cab*}"; use = [ "extract" "reveal" ]; }
          { url = "*"; use = [ "open" "reveal" ]; }
        ];
      };
    };
  };
}
