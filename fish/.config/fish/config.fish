fish_vi_key_bindings

if status is-interactive
end

set EDITOR $(which nvim)

set --export PATH "$HOME/.gem/bin" $PATH
set --export PATH "$HOME/.pack/bin" $PATH
set --export PATH "$HOME/.rbenv/shims" $PATH
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH "$HOME/.pub-cache/bin" $PATH
set --export PATH $BUN_INSTALL/bin $PATH
set --export PATH "$HOME/.local/bin" $PATH
set --export PATH "$HOME/code/stax/" $PATH
set --export PATH "$HOME/flutter/bin" $PATH
set --export PATH "/opt/homebrew/bin" $PATH
set --export PATH "$HOME/Library/Android/sdk/tools/bin" $PATH
set --export PATH "$HOME/.cabal/bin" $PATH
set --export PATH "$HOME/.composer/vendor/bin" $PATH
set --export PATH "$HOME/apps/nvim-macos-arm64/bin" $PATH
set --export PATH "$HOME/.cargo/bin" $PATH
set --export PATH "$HOME/.ghcup/bin" $PATH
set --export PATH "$HOME/Library/Application Support/fnm" $PATH

fnm env --use-on-cd | source

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin $PATH /Users/texoport/.ghcup/bin # ghcup-env

set -l foreground c0caf5
set -l selection 2e3c64
set -l comment 565f89
set -l red f7768e
set -l orange ff9e64
set -l yellow e0af68
set -l green 9ece6a
set -l purple 9d7cd8
set -l cyan 7dcfff
set -l pink bb9af7

# Syntax Highlighting Colors
set -g fish_color_normal $foreground
set -g fish_color_command $cyan
set -g fish_color_keyword $pink
set -g fish_color_quote $yellow
set -g fish_color_redirection $foreground
set -g fish_color_end $orange
set -g fish_color_option $pink
set -g fish_color_error $red
set -g fish_color_param $purple
set -g fish_color_comment $comment
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $green
set -g fish_color_escape $pink
set -g fish_color_autosuggestion $comment

# Completion Pager Colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment
set -g fish_pager_color_selected_background --background=$selection


