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
    benthos
    cachix
    devbox

    # utils
    cargo
    nodejs_22
    curl
    ripgrep
    httpie
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
    vscode-langservers-extracted
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

  programs.vscode = {
      enable = true;
      extensions = with pkgs.vscode-extensions; [
              vscodevim.vim
              yzhang.markdown-all-in-one
      ];
  };
}
