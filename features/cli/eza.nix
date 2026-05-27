{ config, pkgs, lib, ... }:

{
  programs.eza = {
		enable = true;
		git = true;
		icons = "auto";
		enableFishIntegration = true;
		enableBashIntegration = true;
		enableZshIntegration = true;
	};
}
