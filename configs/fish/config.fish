if status is-interactive
  set -U fish_greeting

  set -gx EDITOR nvim

  zoxide init fish | source
end
