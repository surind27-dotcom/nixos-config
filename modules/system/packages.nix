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
    git cmus
    curl lact
    vim godot
    noctalia kdePackages.ark
    discord python3
    appimage-run zig
    cava zls
    gpu-screen-recorder lldb
    sptlrx 
    toilet 
    libxkbcommon
   ];
}
