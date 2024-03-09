{
  description = "myos";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    darwin-custom-icons.url = "github:ryanccn/nix-darwin-custom-icons";
  };

  outputs = inputs @ {
    nixpkgs,
    home-manager,
    darwin,
    ...
  }: let
    system = "aarch64-darwin";
    hostname = "mb";
    username = "pawelzak";
  in {
    formatter.${system} = nixpkgs.legacyPackages.${system}.alejandra;

    darwinConfigurations.${hostname} = darwin.lib.darwinSystem {
      inherit system;

      modules = [
        ./modules/apps.nix
        ./modules/configuration.nix

        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.${username} = import ./home/home.nix;
        }

        inputs.darwin-custom-icons.darwinModules.default

        {
          _module.args = inputs // {inherit hostname username;};
        }
      ];
    };
  };
}
