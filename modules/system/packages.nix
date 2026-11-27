{pkgs,...}:
{
 environment.systemPackages = with pkgs; [
    fastfetch bash-completion
    alacritty yazi
    kitty
    xwayland-satellite kdePackages.kdenlive  
    mpv 
    zed-editor blender
    gimp  
    wget qbittorrent
    git xrandr
    curl lact
    godot 
    noctalia 
    discord python3
    cava 
    gpu-screen-recorder 
    sptlrx aider-chat
    toilet xfce4-xkb-plugin
    libxkbcommon 
    lutris  wineWow64Packages.stagingFull winetricks
    # feh rofi polybar xkb-switch libnotify slock
   ];
}
