# https://nix-community.github.io/home-manager/options.xhtml
{
  pkgs,
  devenv,
  ...
}: {
  home.stateVersion = "23.11";

  imports = [
    ./zsh/zsh.nix
    ./tmux/tmux.nix
  ];

  home.file.".config/alacritty".source = ./alacritty;
  home.file.".config/nvim".source = ./nvim;

  home.packages = with pkgs; [
    # ide
    neovim
    alacritty

    # dev
    gcc
    go-task
    pre-commit
    benthos
    cachix
    devenv.packages.${pkgs.system}.devenv
    devbox

    # utils
    curl
    ripgrep
    fzf
    fd
    zoxide
    eza
    bat
    jq
    yq-go
    zip
    unzip
    glow
    btop
    nix-output-monitor
  ];

  programs.git = {
    enable = true;
    userName = "pawelzak";
    userEmail = "zakpaw36@gmail.com";
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
