{ config, pkgs, ... }:

{
  nix.buildMachines = [{
    hostName = "builder";
    system = "x86_64-linux";
    maxJobs = 2;
    speedFactor = 2;
    supportedFeatures = [];
    mandatoryFeatures = [];
  }];

  nix.distributedBuilds = true;

  nix.extraOptions = ''
    builders-use-substitutes = true
  '';
}
