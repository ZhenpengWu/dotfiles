# dotfiles

## brew.sh

```
$ chmod +x id_rsa ./brew.sh
```

### aria2

- aria2 configuration, see [https://github.com/ZhenpengWu/dotfiles/tree/master/.aria2](https://github.com/ZhenpengWu/dotfiles/tree/master/.aria2)

```
$ brew install aria2
$ cp ${HOME}/.aria2/homebrew.mxcl.aria2.plist ${HOME}/Library/LaunchAgents/homebrew.mxcl.aria2.plist
$ brew services start aria2
```

### mpv

- mpv configuration, see [https://github.com/ZhenpengWu/mpv-config](https://github.com/ZhenpengWu/mpv-config)

### hammerspoon

- hammerspoon configuration, see [https://github.com/ZhenpengWu/dotfiles/tree/master/.hammerspoon](https://github.com/ZhenpengWu/dotfiles/tree/master/.hammerspoon)

### karabiner

- karabiner configuration, see [https://github.com/ZhenpengWu/dotfiles/tree/master/.config/karabiner](https://github.com/ZhenpengWu/dotfiles/tree/master/.config/karabiner)

## macos.sh

```
$ chmod +x id_rsa ./macos.sh
```

## zsh & .oh-my-zsh

### themes: spaceship-prompt

```
$ git clone https://github.com/denysdovhan/spaceship-prompt.git $ZSH_CUSTOM/themes/spaceship-prompt
```

### plugins: zsh-autosuggestions

```
$ git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
```

### plugins: zsh-completions

```
$ git clone https://github.com/zsh-users/zsh-completions $ZSH_CUSTOM/plugins/zsh-completions
```

### plugins: zsh-syntax-highlighting

```
$ git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
```

## .tmux

```
$ ln -s -f .tmux/.tmux.conf
$ cp .tmux/.tmux.conf.local .
```

## .ssh

- ssh configuration, see [https://github.com/ZhenpengWu/dotfiles/tree/master/.ssh](https://github.com/ZhenpengWu/dotfiles/tree/master/.ssh)

## .config

- iterm2
- dash
- alfred

