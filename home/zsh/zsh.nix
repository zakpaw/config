{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    dotDir = ".config/zsh";

    antidote = {
      enable = true;
      plugins = [
        "marlonrichert/zsh-autocomplete"
        "zsh-users/zsh-autosuggestions"
        "zsh-users/zsh-syntax-highlighting"
        "jeffreytse/zsh-vi-mode"
      ];
    };

    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
        name = "powerlevel10k-config";
        src = ./theme;
        file = "p10k.zsh";
      }
      {
        name = "fzf-tab";
        src = pkgs.zsh-fzf-tab;
        file = "share/fzf-tab/fzf-tab.plugin.zsh";
      }
    ];

    shellAliases = {
      # code = "/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code";
      ".." = "cd ..";
      v = "nvim";
      vi = "nvim";
      vim = "nvim";
      "v." = "nvim .";
      ls = "eza --icons";
      la = "eza -a --icons";
      tree = "eza --tree --icons";
    };

    sessionVariables = {
      PATH = "$PATH:/usr/local/bin:/Users/zpawe/.toolbox/bin";
      VISUAL = "nvim";
      EDITOR = "$VISUAL";
      MANPAGER = "nvim +Man!";
      MANWIDTH = "999";
    };

    initExtra = ''
      zstyle ':completion:*:git-checkout:*' sort false
      zstyle ':completion:*:descriptions' format '[%d]'
      zstyle ':completion:*' menu no
      zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
      zstyle ':fzf-tab:*' switch-group '<' '>'
      eval "$(zoxide init zsh)"
      eval "$(fzf --zsh)"
      autoload -U compinit
      compinit
    '';
  };
}
