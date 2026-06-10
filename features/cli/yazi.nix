{ config, pkgs, lib, ... }:

{
  programs.yazi = {
    enable = true;
    shellWrapperName = "y";
    enableFishIntegration = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
  };
}
