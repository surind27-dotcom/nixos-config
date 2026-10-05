{pkgs,...}:
{
 environment.systemPackages = with pkgs; [
    fastfetch bash-completion
    alacritty yazi
    fuzzel kitty
    xwayland-satellite pkgs.kdePackages.kdenlive  
    gnome-extension-manager mpv
    jetbrains.idea
    gimp
    wget
    git
    curl
    vim
    noctalia
    discord
    appimage-run
    cava
    gpu-screen-recorder
    sptlrx
    toilet
   ];
}
