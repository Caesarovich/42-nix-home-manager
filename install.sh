# Download and install nix-user-chroot
ARCH=$(uname -m)

NIX_CHROOT_DOWNLOAD_URL=https://github.com/nix-community/nix-user-chroot/releases/download/2.1.1/nix-user-chroot-bin-2.1.1-${ARCH}-unknown-linux-musl

echo "Downloading nix-user-chroot from $NIX_CHROOT_DOWNLOAD_URL"

INSTALL_PATH="${HOME}/nix-user-chroot"

curl -L "$NIX_CHROOT_DOWNLOAD_URL" -o ${INSTALL_PATH}


# Installing the nixos environment
chmod +x ${INSTALL_PATH}

NIX_FOLDER="${HOME}/.nix"

mkdir -m 0755 ${NIX_FOLDER}

${INSTALL_PATH} ${NIX_FOLDER} bash -c "curl -L https://nixos.org/nix/install | bash"

echo "Installation complete. You can run nix-user-chroot with ${INSTALL_PATH}"

# Enabling home-manager
echo "Enabling home-manager for the current user"
${INSTALL_PATH} ${NIX_FOLDER} nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
${INSTALL_PATH} ${NIX_FOLDER} nix-channel --update
${INSTALL_PATH} ${NIX_FOLDER} nix-shell '<home-manager>' -A install

# Clone this repo

REPO_URL=https://github.com/Caesarovich/42-nix-home-manager

mkdir -p "${HOME}/.config/home-manager"
git clone $REPO_URL "${HOME}/.config/home-manager"