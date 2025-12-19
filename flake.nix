{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }:
    let
      rofiTheme = "style-1";
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit self; };
          modules = [
            ./hosts/nixos

            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.finnh = import ./users/finnh/home.nix;
                extraSpecialArgs = {
                  inherit self;
                };
              };
            }
          ];
        };
      };

      packages.${system} = {
        rofi-collection = pkgs.fetchFromGitHub {
          owner = "adi1090x";
          repo = "rofi";
          rev = "adfcc0770fa10daec5d87e3fb4ca6acd1d309491";
          sha256 = "yMKpwxdwvp7ryz2XXunbjC/5ud9HHEDzyYRhM540958=";
        };

        rofi-launcher = pkgs.writeShellScriptBin "rofi-launcher" ''
          theme='${rofiTheme}'
          ${pkgs.rofi}/bin/rofi \
            -show drun \
            -theme $HOME/.config/rofi/launchers/type-6/$theme.rasi
        '';

        rofi-powermenu = pkgs.writeShellScriptBin "rofi-powermenu" ''
          theme='${rofiTheme}'
          ${self.packages.${system}.rofi-collection}/files/powermenu/type-6/powermenu.sh
        '';
      };
    };
}
