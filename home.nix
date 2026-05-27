{ config, pkgs, ... }:

{
  imports = [
    ./flavors/minimal
  ];



  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = builtins.getEnv "USER";
  home.homeDirectory = "/home/" + config.home.username;

  # Environment variables
  home.sessionVariables = {
    STUDENT_USERNAME = builtins.getEnv "USER";
    STUDENT_EMAIL = builtins.getEnv "USER" + "@student.42lyon.fr";
  };

  home.packages = [
    pkgs.devenv
    pkgs.terminal-toys
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Aliases for commands. You can also use this to add arguments to existing commands.
  home.shellAliases = {
    gs = "git status";
    gl = "git log --oneline --graph --decorate";
    gcl = "git clone";
  };

    # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.11"; # Please read the comment before changing.

  nixpkgs.config.allowUnfree = true;
}
