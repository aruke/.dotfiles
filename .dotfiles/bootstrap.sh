#! /bin/zsh

# Ask for admin password
sudo -v
# Keep the sudo timestamp until the script is finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Clone & configure .dotfiles repository
git clone --bare git@github.com:aruke/.dotfiles.git $HOME/.dotfiles
function dotfiles {
   /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}
mkdir -p .dotfiles-backup
dotfiles checkout
if [ $? = 0 ]; then
  echo "Checked out dotfiles.";
  else
    echo "Backing up pre-existing dotfiles.";
    dotfiles checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .dotfiles-backup/{}
fi;
dotfiles checkout
dotfiles config status.showUntrackedFiles no

# Oh-my-zsh installation
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
# Restart shell?

# Setup Homebrew & Cask
CI=1 zsh .dotfiles/brew.sh
