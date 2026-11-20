{pkgs,...}:
{
 environment.systemPackages = with pkgs; [
    fastfetch bash-completion
    alacritty yazi
    fuzzel kitty
    xwayland-satellite kdePackages.kdenlive  
    mpv 
    zed-editor blender
    gimp  
    wget qbittorrent
    git xrandr
    curl lact
    godot lufus
    noctalia 
    discord python3
    cava 
    gpu-screen-recorder 
    sptlrx aider-chat
    toilet xfce4-xkb-plugin
    libxkbcommon 
    thunar 
    ristretto xarchiver
    gnome-disk-utility warehouse
    mindustry-wayland 
    lutris  wineWow64Packages.stagingFull winetricks
   ];
}
