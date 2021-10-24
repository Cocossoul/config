{ config, pkgs, ... }:

{
  imports =
    [
      # Per program config
      ./i3.nix
      ./ssd.nix
      # ./picom.nix
      # ./polybar.nix
      # ./redshift.nix
      # ./alacritty.nix
    ];
  # networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # nmtui FTW
  networking.networkmanager.enable = true;

  # Add NTFS support (for encrypted ssd)
  boot.supportedFilesystems = [ "ntfs" ];

  # Set your time zone.
  time = {
    timeZone = "Europe/Paris";
    hardwareClockInLocalTime = true;
  };

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "fr";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;


  # Enable i3
  services.xserver.displayManager = {
    lightdm.enable = true;
    defaultSession = "none+i3";
  };


  # Configure keymap in X11
  services.xserver.layout = "fr";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Intel power management
  powerManagement.powertop.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput = {
    enable = true;
    touchpad = {
      naturalScrolling = true;
      tapping = true;
    };
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.coco = {
    isNormalUser = true;
    createHome = true;
    extraGroups = [ "wheel" "networkmanager" "video" ]; # Enable ‘sudo’ for the user.
  };

  # Zsh as default shell
  programs.zsh.enable = true;
  users.extraUsers.coco.shell = pkgs.zsh;

  # Allow not open source packages (ex: google-chrome)
  nixpkgs.config.allowUnfree = true;

  # Periodic upgrades
  system.autoUpgrade.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # Nix
    home-manager
    # WM
    polybar
    redshift
    geoclue2
    picom
    autorandr
    # Editor
    vim nano
    # Utils
    wget
    git
    tree
    which
    less
    tree
    htop
    fakeroot
    lsd
    glibc
    gcc
    gnumake
    neofetch
    light
    # Terminal
    alacritty
    zsh
    oh-my-zsh
    powertop
    # Graphical utils
    firefox
    google-chrome
    thunderbird
    gnome.nautilus
    gimp
    # Media
    vlc
    qbittorrent
  ];

  # Adjust screen brightness using light
  programs.light.enable = true;

  # Redshift
  services.redshift = {
    enable = true;
    provider = "manual";
  };
  location = {
    latitude = 48.0;
    longitude = 2.3;
  };

  # Enable picom
  services.picom = {
    enable = true;
    backend = "glx";
    vSync = true;
  };

  # Vim as default
  environment.variables.EDITOR = "vim";

  # Fonts
  fonts.fonts = with pkgs; [
    meslo-lgs-nf # p10k
    font-awesome
  ];
}
