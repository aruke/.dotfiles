#! /bin/zsh

# Sets up Homebrew with Brewfile bundler.

# TODO Set Brefile in dotfiles as global
export HOMEBREW_BREWFILE=".dotfiles/Brewfile"

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

if ! which brew > /dev/null; then
  /bin/zsh -c "$(curl -fsSL 'https://raw.githubusercontent.com/Homebrew/install/master/install.sh')"
fi

brew analytics off
brew update
brew doctor

# Install dependencies from .dotfiles/Brefile
brew bundle --file=~/.dotfiles/Brewfile
