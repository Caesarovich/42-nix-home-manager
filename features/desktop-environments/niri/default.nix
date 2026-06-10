{ pkgs, inputs, ... }:

{
	imports = [
        inputs.noctalia.homeModules.default
    ];

	programs.noctalia = {
        enable = true;
        settings = {
          # configure options
        };
	};

  xdg.configFile."niri/config.kdl".text = ''
    include "${pkgs.niri.doc}/share/doc/niri/default-config.kdl"
    environment {
      NIXOS_OZONE_WL "1"
      ELECTRON_OZONE_PLATFORM_HINT "auto"
    }
    xwayland-satellite {
      path "${pkgs.lib.getExe pkgs.xwayland-satellite}"
    }
    spawn-at-startup "${pkgs.lib.getExe inputs.noctalia.packages.${pkgs.system}.default}"
  '';

	nixpkgs.overlays = [
    (final: prev: {
      niri = prev.niri.overrideAttrs (old: {
        nativeBuildInputs = old.nativeBuildInputs or [] ++ [ pkgs.makeWrapper ];
        
        postInstall = old.postInstall or "" + ''
          wrapProgram "$out/bin/niri" \
            --suffix LD_LIBRARY_PATH ":" "${pkgs.lib.makeLibraryPath [
              pkgs.libxcursor
              pkgs.libx11
              pkgs.libxrandr
              pkgs.libxfixes
			  pkgs.libxi
            ]}"
        '';
      });
    })
  ];


  home.packages = with pkgs; [
		alacritty
		niri
        xwayland-satellite
        glibc
	];
}
