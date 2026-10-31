{pkgs,...}:
{
 environment.systemPackages = with pkgs; [
    fastfetch bash-completion
    alacritty yazi
    fuzzel kitty
    xwayland-satellite kdePackages.kdenlive  
    gnome-extension-manager mpv 
    zed-editor blender
    gimp vesktop 
    wget qbittorrent
    git xorg.xrandr
    curl lact
    godot
    noctalia 
    discord python3
    appimage-run 
    cava steam-run
    gpu-screen-recorder 
    sptlrx aider-chat
    toilet 
    libxkbcommon
    thunar
    ristretto xarchiver
    gnome-disk-utility warehouse
    mindustry-wayland devilutionx
   ];
}
