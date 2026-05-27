{ config, pkgs, lib, ... }:

{
  programs.vim = {
    enable = true;
    defaultEditor = true;
    settings = {
      tabstop = 2;
      copyindent = true;
    };
  };
}
