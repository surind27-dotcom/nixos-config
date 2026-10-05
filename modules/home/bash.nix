{pkgs,...}:
{
 programs.bash = {
  enable = true;
  enableCompletion = true;
  initExtra = ''
    NIXOS_ICON=$'\uf313'
    PS1="\[\e[34m\][ ''${NIXOS_ICON} \u@\h ]\$ \[\e[0m\]"
   # Lyrics в терминале: крупный синий текст из sptlrx
    lyrics() {
      clear
      sptlrx pipe | while IFS= read -r line; do
        clear
        toilet -f smblock "$line" | while IFS= read -r l; do
          printf '\e[1;38;2;137;180;250m%s\e[0m\n' "$l"
        done
      done
    }
  '';
};
}
