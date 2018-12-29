#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

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

# Install zsh
brew install zsh
# Change to the new shell, prompts for password
chsh -s /usr/local/bin/zsh

# Install `wget` with IRI support.
brew install wget --with-iri

# Install Python
brew install python
brew install python@2

# Install more recent versions of some OS X tools.
brew install vim --override-system-vi

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install binutils
brew install netpbm
brew install xz

# Install other useful binaries.
brew install git
brew install git-lfs
brew install git-flow
brew install git-extras
brew install hub
brew install imagemagick --with-webp
brew install lua
brew install tree
brew install pandoc
brew install youtube-dl
brew install ruby
brew install gcc
brew install node
brew install node@8
brew install cloc
brew install htop
brew install neovim
brew install go
brew install erlang 
brew install bet
brew install les 
brew install tmux

# Install sql
brew install mysql
brew install postgresql
brew install sqlite

# Install aria2
brew install aria2
cp ${HOME}/.aria2/homebrew.mxcl.aria2.plist ${HOME}/Library/LaunchAgents/homebrew.mxcl.aria2.plist
# Start aria2 when login
brew services start aria2

# Lxml and Libxslt
brew install libxml2
brew install libxslt
brew link libxml2 --force
brew link libxslt --force

# Install Heroku
brew install heroku/brew/heroku
heroku update

# Install font tools.
brew tap homebrew/cask-fonts
brew cask install font-fira-code
brew cask install font-hack-nerd-font
brew cask install font-firacode-nerd-font
brew cask install font-firacode-nerd-font-mono
brew cask install font-firamono-nerd-font
brew cask install font-firamono-nerd-font-mono

# Core casks
brew cask install alfred
brew cask install iterm2-nightly
brew cask install java
brew cask install visual-studio-code-insiders
brew cask install xquartz
brew cask install google-chrome
brew cask install skype
brew cask install slack
brew cask install dropbox
brew cask install teamviewer
brew cask install astrill
brew cask install airmail-beta
brew cask install hammerspoon
brew cask install wireshark
brew cask install postman
brew cask install karabiner-elements
brew cask install mpv

brew cask install airmail-beta                 
brew cask insgall neteasemusic
brew cask install robo-3t
brew cask install plistedit-pro                 
brew cask install astrill                                                           
brew cask install calibre                                                             
brew cask install thunder
brew cask install julia                                          
                                                            
# Development tool casks
brew cask install virtualbox

#Remove comment to install LaTeX distribution MacTeX
brew cask install mactex

# Install Docker, which requires virtualbox
brew install docker
brew install boot2docker

# Install developer friendly quick look plugins; see https://github.com/sindresorhus/quick-look-plugins
brew cask install hetimazipql qlcolorcode qlimagesize qlmarkdown qlmobi qlprettypatch qlvideo quicklook-csv quicklook-json

# Remove outdated versions from the cellar.
brew cleanup
