{ pkgs, lib, ... }:

{
  services.xserver =
    {
      desktopManager.xterm.enable = false;

      windowManager.i3 = {
        enable = true;
        package = pkgs.i3-gaps;
        extraPackages = with pkgs; [
          dmenu
          i3lock
          feh
        ];
      };
    };

    environment.sessionVariables.TERMINAL = [ "alacritty" ];
  }
