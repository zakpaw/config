{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    plugins = with pkgs; [
      tmuxPlugins.sensible
      tmuxPlugins.resurrect
      tmuxPlugins.continuum
      tmuxPlugins.vim-tmux-navigator
      tmuxPlugins.yank
    ];
    extraConfig = builtins.readFile (builtins.toPath ./tmux.conf);
  };
}

