#! /bin/zsh

# Ask for admin password
sudo -v
# Keep the sudo timestamp until the script is finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Command Line Developer tools are needed for next installs
/bin/zsh  install_command_line_tools.sh

# Clone & configure .dotfiles repository
git clone --bare https://github.com/aruke/.dotfiles.git $HOME/.dotfiles
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
# Change owner of problematic directories
chown -R $USER /usr/local/share/zsh
chown -R $USER /usr/local/share/zsh/site-functions

# Setup Homebrew & Cask
CI=1 zsh .dotfiles/brew.sh

# Setup MacOS defaults
/bin/zsh .dotfiles/.macos
