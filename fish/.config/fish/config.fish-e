fish_vi_key_bindings

if status is-interactive
end

set EDITOR $(which nvim)

set --export BUN_INSTALL "$HOME/.bun"
set --export PATH "$HOME/.cabal/bin" $PATH
set --export PATH "$HOME/.cargo/bin" $PATH
set --export PATH "$HOME/.composer/vendor/bin" $PATH
set --export PATH "$HOME/.gem/bin" $PATH
set --export PATH "$HOME/.ghcup/bin" $PATH
set --export PATH "$HOME/.local/bin" $PATH
set --export PATH "$HOME/.pack/bin" $PATH
set --export PATH "$HOME/.pub-cache/bin" $PATH
set --export PATH "$HOME/.rbenv/shims" $PATH
set --export PATH "$HOME/Library/Android/sdk/tools/bin" $PATH
set --export PATH "$HOME/Library/Application Support/fnm" $PATH
set --export PATH "$HOME/apps/nvim-macos-arm64/bin" $PATH
set --export PATH "$HOME/code/stax/" $PATH
set --export PATH "$HOME/flutter/bin" $PATH
set --export PATH "/opt/homebrew/bin" $PATH
set --export PATH $BUN_INSTALL/bin $PATH

fnm env --use-on-cd | source

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin $PATH /Users/texoport/.ghcup/bin # ghcup-env
