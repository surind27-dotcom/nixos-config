{pkgs,...}:
{
 environment.systemPackages = with pkgs; [
    fastfetch bash-completion
    alacritty yazi
    fuzzel kitty
    xwayland-satellite kdePackages.kdenlive  
    gnome-extension-manager mpv 
    zed-editor
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
