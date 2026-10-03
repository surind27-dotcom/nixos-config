# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];
#flakes enable
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = false;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.useOSProber = true;
  boot.supportedFilesystems = ["ntfs3"];
# disks
  fileSystems."/mnt/disk1" = {
  device = "/dev/disk/by-uuid/EAFC148BFC1453E3";
  fsType = "ntfs3";
  options = [
    "rw"
    "uid=1000"
    "gid=100"
    "umask=0000"
    "nofail"
    "noatime"
  ];
};

fileSystems."/mnt/disk2" = {
  device = "/dev/disk/by-uuid/BEF096DAF096986B";
  fsType = "ntfs3";
  options = [
    "rw"
    "uid=1000"
    "gid=100"
    "umask=0000"
    "nofail"
    "noatime"
  ];
};
fileSystems."/mnt/disk1/SteamLibrary/steamapps/compatdata" = {
  device = "/home/danil/.steam/steam/steamapps/compatdata";
  fsType = "none";
  options = [ "bind" "nofail" ];
};

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  boot.kernelModules = [ "xt_NFQUEUE" ];
  networking.firewall.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Moscow";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ru_RU.UTF-8";
    LC_IDENTIFICATION = "ru_RU.UTF-8";
    LC_MEASUREMENT = "ru_RU.UTF-8";
    LC_MONETARY = "ru_RU.UTF-8";
    LC_NAME = "ru_RU.UTF-8";
    LC_NUMERIC = "ru_RU.UTF-8";
    LC_PAPER = "ru_RU.UTF-8";
    LC_TELEPHONE = "ru_RU.UTF-8";
    LC_TIME = "ru_RU.UTF-8";
  };

  # Enable the GNOME Desktop Environment.
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
  services.udisks2.enable = true;
  security.polkit.enable = true;
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
  

  # Enable CUPS to print documents.
  services.printing.enable = true;
#aliases
  environment.shellAliases = {
  nixup = "sudo nixos-rebuild switch --flake /etc/nixos/#nixos";
  nixsave = "cd /etc/nixos && sudo git add -A && sudo git commit -m 'Auto-save' && sudo git push; cd ~";
  nixclear = "sudo nix-collect-garbage -d";
  nixgens = "sudo nixos-rebuild list-generations";
  # Управление zapret
  zaps = "sudo systemctl status zapret-discord-youtube";       # status
  zapr = "sudo systemctl restart zapret-discord-youtube";      # restart
  zapstop = "sudo systemctl stop zapret-discord-youtube";      # stop
  zapstart = "sudo systemctl start zapret-discord-youtube";    # start
  zaplog = "sudo journalctl -u zapret-discord-youtube -f";     # live log
};


  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    # jack.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."danil" = {
    isNormalUser = true;
    description = "danil";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };
#programs
  programs.firefox.enable = true;
  programs.steam.enable = true;
  programs.niri.enable = true;
  programs.xwayland.enable = true;
  programs.thunar.enable = true;
#  programs.throne.enable = true;
#  programs.throne.tunMode.enable = true;

#Fonts Nerd Fonts
  fonts.packages = with pkgs; [
  nerd-fonts.jetbrains-mono
  nerd-fonts.fira-code
];




  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile.
   environment.systemPackages = with pkgs; [
    fastfetch
    alacritty
    fuzzel
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
   ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "26.05"; # Did you read the comment?
  # =========================================================================
  #  Настройки Видеокарты NVIDIA
  # =========================================================================
  hardware.graphics = {
  enable = true;
  enable32Bit = true;  # <-- Убедитесь, что эта строка есть
};

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    open = false; # Ставь true, только если у тебя видеокарта RTX 2000 или новее
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
  

}
