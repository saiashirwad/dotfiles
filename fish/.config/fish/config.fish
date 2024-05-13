fish_vi_key_bindings

if status is-interactive
end

set EDITOR $(which nvim)

set --export BUN_INSTALL "$HOME/.bun"
set --export PATH "$HOME/.pub-cache/bin" $PATH
set --export PATH $BUN_INSTALL/bin $PATH
set --export PATH "$HOME/.local/bin" $PATH
set --export PATH "$HOME/code/stax/" $PATH
set --export PATH "$HOME/flutter/bin" $PATH
set --export PATH "/opt/homebrew/bin" $PATH
set --export PATH "$HOME/.cabal/bin" $PATH
set --export PATH "$HOME/.cargo/bin" $PATH
set --export PATH "$HOME/.ghcup/bin" $PATH
set --export PATH "$HOME/Library/Application Support/fnm" $PATH

fnm env | source

starship init fish | source

# opam configuration
source /Users/texoport/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
