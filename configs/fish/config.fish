if status is-interactive
  set -U fish_greeting

  set -gx EDITOR nvim

  zoxide init fish | source

  starship init fish | source
  set -gx STARSHIP_CONFIG ~/.config/starship/starship.toml

  fzf --fish | source
  set -gx FZF_DEFAULT_COMMAND "fd --hidden --follow --color=always --exclude='**/.git/'"
  set -gx FZF_DEFAULT_OPTS "--exact --ansi --style=full --height=50% --layout=reverse --info=inline"
  set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND "--type=f"
  set -gx FZF_CTRL_T_OPTS "--preview='bat --style=numbers --color=always {}'"
  set -gx FZF_ALT_C_COMMAND $FZF_DEFAULT_COMMAND "--type=d"
  set -gx FZF_ALT_C_OPTS "--preview='eza --color=always --icons --long --all --group-directories-first --header --git --git-repos --total-size {}'"

  alias ls "eza --color=always --icons --long --all --group-directories-first --header --git --git-repos"
  alias tree "eza --tree --color=always --icons --long --all --group-directories-first --header --git --git-repos"
end

fish_add_path "/home/rorik/.local/bin"
fish_add_path "/home/rorik/.cargo/bin"
