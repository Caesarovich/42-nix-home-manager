{ config, pkgs, lib, ... }:

{
  programs.lazygit = {
    enable = true;
    enableFishIntegration = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
  };
}
