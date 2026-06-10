# Nix home manager config for 42 school

## Installation

The script installs the nix-chroot environment and enables home-manager.
```sh
wget -O- https://raw.githubusercontent.com/Caesarovich/42-nix-home-manager/refs/heads/main/install.sh | sh
```

Then enter the nix environment and run the following command to install home-manager configuration:
```sh
./nix-user-chroot ~/.nix
home-manager switch --flake ~/.config/home-manager#default
```

## Usage

To enter the nix environment, run the following command:
```sh
./nix-user-chroot ~/.nix
```

To update the home-manager configuration, run the following command:
```sh
home-manager switch --flake ~/.config/home-manager#default
```

To update the packages, run the following command:
```sh
nix-channel --update
home-manager switch --flake ~/.config/home-manager#default
```

## Occasional cleanup

Nix has a tendency to accumulate old packages and configurations, which can take up a lot of disk space. To clean up old packages and configurations, run the following commands:
```sh
nix-env --delete-generations old
home-manager expire-generations "-1 days"
nix-collect-garbage -d
nix-store --optimise
```