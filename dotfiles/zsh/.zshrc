[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

plug "$HOME/.config/zsh/theme"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "marlonrichert/zsh-autocomplete"
plug "jeffreytse/zsh-vi-mode"

alias code="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"
alias tmux="tmux -f $XDG_CONFIG_HOME/tmux/tmux.conf"
alias v=nvim
alias vi=nvim
alias vim=nvim
alias v.="nvim ."
alias ls="eza --icons"
alias la="eza -a --icons"
alias tree="eza --tree --icons"

export PATH=$PATH:/usr/local/bin:/Users/zpawe/.toolbox/bin
export VISUAL=nvim
export EDITOR=$VISUAL
export MANPAGER="nvim"

lolcat <<'EOF'
     __  ,
 .--()°'.'
'|, . ,'
 !_-(_\
EOF

# completions
autoload -Uz compinit
compinit

eval "$(zoxide init zsh)"
