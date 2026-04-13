{ pkgs, lib, config, inputs, ... }:

{

  packages = [ pkgs.git pkgs.secretspec ];

  languages.nix.enable = true;

  scripts = {
    update.exec = ''
      nix-channel --update
    '';
    upgrade.exec = ''
      nix-channel --update && secretspec run -- home-manager switch
    '';
  };

  # See full reference at https://devenv.sh/reference/options/
}
