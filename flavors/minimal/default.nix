{ pkgs, lib, ... }:
{
  imports = [
    ../../features/shell/fish.nix
		# ../../features/shell/bash.nix
		# ../../features/shell/zsh.nix
		../../features/editors/fresh.nix
		../../features/editors/vim.nix
		../../features/editors/vscode.nix
    ../../features/cli/bat.nix
    ../../features/cli/btop.nix
    ../../features/cli/git.nix
    ../../features/cli/lazygit.nix
    ../../features/cli/lazydocker.nix
    ../../features/cli/fastfetch.nix
    ../../features/cli/eza.nix
    ../../features/cli/yazi.nix
    ../../features/cli/home-manager.nix
  ];

  home.shellAliases = {
    cat = "bat --paging=never --style=plain";
  };
}