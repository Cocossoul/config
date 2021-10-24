{ config, pkgs, ... }:

{
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Autologin because disk is encrypted anyway
  services.xserver.displayManager.autoLogin = {
    enable = true;
    user = "coco";
  };

  # Disk decryption
  boot.initrd.luks.devices."root" =
    {
      name = "root";
      device = "/dev/disk/by-uuid/2e744bf7-a870-47fd-b1c7-dcd20117449e";
      preLVM = true; # We have a LVM volume for root and swap
      allowDiscards = true; # Allow TRIM
    };

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.wlp107s0.useDHCP = true;
}

