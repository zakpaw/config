{
  description = "myos";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    darwin-custom-icons.url = "github:ryanccn/nix-darwin-custom-icons";
    devenv.url = "github:cachix/devenv/latest";
  };

  outputs = inputs @ {
    nixpkgs,
    home-manager,
    darwin,
    ...
  }: let
    system = "aarch64-darwin";
    hostname = "mb";
    username = "pawel";
    specialArgs = inputs // {inherit hostname username;};
  in {
    formatter.${system} = nixpkgs.legacyPackages.${system}.alejandra;

    darwinConfigurations.${hostname} = darwin.lib.darwinSystem {
      inherit system specialArgs;

      modules = [
        ./host/configuration.nix

        inputs.darwin-custom-icons.darwinModules.default

        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = specialArgs;
          home-manager.users.${username} = import ./home/home.nix;
        }
      ];
    };
  };
}
