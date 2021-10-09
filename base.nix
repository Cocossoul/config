{ config, pkgs, ... }:

{
  imports =
    [
      # Per program config
      ./i3.nix
      # ./picom.nix
      # ./polybar.nix
      # ./redshift.nix
      # ./alacritty.nix
    ];
  # networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

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
    extraGroups = [ "wheel" "networkmanager" "video" ]; # Enable ‘sudo’ for the user.
  };

  # Zsh as default shell
  programs.zsh.enable = true;
  users.extraUsers.coco.shell = pkgs.zsh;
  
  # Allow not free packages (ex: not open source, google-chrome)
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # WM
    polybar
    redshift
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
    dolphin
    ark
    gimp
    # Media
    vlc
    qbittorrent
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

  # Adjust screen brightness using light
  programs.light.enable = true;
}
