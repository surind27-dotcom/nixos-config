{pkgs,...}
{
 environment.systemPackages = with pkgs; [
    fastfetch bash-completion
    alacritty yazi
    fuzzel kitty
    xwayland-satellite
    polkit_gnome
    gnome-extension-manager
    jetbrains.idea
    gimp
    wget
    git
    curl
    vim
    noctalia
    noctalia-shell
    discord
    appimage-run
    cava
    gpu-screen-recorder
    virtualbox
   ];
}
