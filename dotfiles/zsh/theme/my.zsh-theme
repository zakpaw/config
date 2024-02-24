# Load vcs_info for Git repository status
autoload -Uz vcs_info

# Enable vcs_info for Git and set up the prompt
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git:*' formats " %F{#b4befe}%b%F{#b4befe}"

# Function to update vcs_info before displaying the prompt
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )

# Enable prompt substitution
setopt prompt_subst

PROMPT="%F{#fab387}%n%{%f%}@%F{#f9e2af}%m%{%f%}:${vcs_info_msg_0_}%F{#b4befe} %B%F{#89b4fa}%~%{%f%} 
#%{%f%} "

RPROMPT=''
