#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do
    sudo -n true
    sleep 60
    kill -0 "$$" || exit
done 2>/dev/null &

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils

# Install Shell
brew install zsh fish bash
# Change to the new shell, prompts for password
chsh -s /usr/local/bin/zsh

# Install emacs & spacemacs; see https://github.com/syl20bnr/spacemacs
brew install emacs --with-cocoa
brew tap d12frosted/emacs-plus
brew install emacs-plus
ln -s /usr/local/opt/emacs-plus/Emacs.app /Applications
brew link --overwrite emacs-plus

# Install vim & neovim; see https://github.com/neovim/neovim
brew install vim --override-system-vi
brew install neovim

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install binutils
brew install netpbm
brew install xz

# Install tmux; see https://github.com/gpakosz/.tmux
brew install tmux
brew install tmux-xpanes
brew install reattach-to-user-namespace

# Install git & related tools
brew install git
brew install git-lfs
brew install git-flow
brew install git-extras
brew install gpg
brew install pinentry-mac
brew install hub

# Install Programming Languages
brew install gcc
brew install node
brew install node@8
brew install erlang
brew install go
brew install ruby
brew install lua
brew install lua@5.1
brew install r
brew install python
brew install python@2
brew install cmake
brew cask install java
brew cask install julia

# Install sqls
brew install mysql
brew install postgresql
brew install sqlite

# Install aria2 & start aria2 service
brew install aria2
cp ${HOME}/.aria2/homebrew.mxcl.aria2.plist ${HOME}/Library/LaunchAgents/homebrew.mxcl.aria2.plist
brew services start aria2

# Install video & audio command line
brew install ffmpeg
brew install flac
brew install youtube-dl

# Install other useful binaries.
brew install wget --with-iri
brew install curl
brew install telnet
brew install grep the_silver_searcher # grep / ag
brew install imagemagick --with-webp
brew install pandoc # see https://github.com/jgm/pandoc
brew install cloc   # see https://github.com/AlDanial/cloc
brew install htop
brew install less
brew install duti
brew install yank
brew install cmatrix
brew install whois
# brew install subversion
# brew install octave

# Install zsh plugins
brew install autojump
brew install thefuck
brew install fzf
# brew install bat

# Install Lxml and Libxslt
brew install libxml2
brew install libxslt
brew link libxml2 --force
brew link libxslt --force

# Install Heroku
brew install heroku/brew/heroku
heroku update

# Install development tools
brew cask install iterm2-nightly
brew cask install visual-studio-code-insiders
brew cask install wireshark
brew cask install postman
brew cask install robo-3t
brew cask install virtualbox

# Install Docker, which requires virtualbox
brew install docker
brew install docker-machine
brew install boot2docker

# Install utility tolls
brew cask install alfred
brew cask install hammerspoon
brew cask install karabiner-elements
brew cask install plistedit-pro
brew cask install squirrel

# Install productivity tools
brew cask install google-chrome
# brew cask install airmail-beta
brew cask install teamviewer
brew cask install dropbox
brew cask install slack

# Install LaTeX distribution MacTeX
brew cask install mactex

# Intall other tools
brew cask install mpv
brew cask install xquartz
# brew cask install skype
# brew cask install astrill
brew cask install neteasemusic
brew cask install calibre
brew cask install thunder
brew cask install mkvtoolnix

# Install font tools
brew tap homebrew/cask-fonts
brew cask install font-fira-code
brew cask install font-hack-nerd-font
brew cask install font-firacode-nerd-font
brew cask install font-firacode-nerd-font-mono
brew cask install font-firamono-nerd-font
brew cask install font-firamono-nerd-font-mono

# Install developer friendly quick look plugins; see https://github.com/sindresorhus/quick-look-plugins
brew cask install hetimazipql qlcolorcode qlimagesize qlmarkdown qlmobi qlprettypatch qlvideo quicklook-csv quicklook-json

# Remove outdated versions from the cellar.
brew cleanup
