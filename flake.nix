{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    tpm = {
      url = "github:tmux-plugins/tpm";
      flake = false;
    };
  };

  outputs = {
    nixpkgs,
    flake-utils,
    tpm,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {
        inherit system;
      };
      inherit (pkgs) lib;
    in {
      devShells.default = pkgs.mkShell {
        packages = with pkgs; [
          zsh
          tmux
          neovim
          ripgrep
          fzf
          fd
          git
          zoxide
          lolcat
          eza
          bat
          jq
          gcc
        ];

        shellHook = ''
          export HOME=$(mktemp -d)
          export XDG_CACHE_HOME="$HOME/.cache"
          export XDG_CONFIG_HOME="$HOME/.config"
          export XDG_DATA_HOME="$HOME/.local/share"
          export XDG_STATE_HOME="$HOME/.local/state"
          export ZDOTDIR=$HOME/.config/zsh
          export TMUX_TPM=${tpm}

          mkdir -p "$HOME/.config"
          ${lib.getExe pkgs.xorg.lndir} -silent ${./dotfiles} $HOME/.config

          cd "$HOME"
          zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --keep --branch release-v1
        '';
      };

      formatter = nixpkgs.legacyPackages.${system}.alejandra;
    });
}
