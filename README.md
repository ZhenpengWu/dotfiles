# dotfiles

## brew.sh

```
$ chmod +x ./brew.sh
```

### aria2

- aria2 configuration, see [this](https://github.com/ZhenpengWu/dotfiles/tree/master/.aria2)
- copy `aria2.plist` from `.config` folder to `LaunchAgents` folder, and start aria2 at startup

```
$ cp ${HOME}/.aria2/homebrew.mxcl.aria2.plist ${HOME}/Library/LaunchAgents/homebrew.mxcl.aria2.plist
$ brew services start aria2
```

### mpv

- mpv configuration, see [this](https://github.com/ZhenpengWu/mpv-config)

### hammerspoon

- hammerspoon configuration, see [this](https://github.com/ZhenpengWu/dotfiles/tree/master/.hammerspoon)

### karabiner

- karabiner configuration, see [this](https://github.com/ZhenpengWu/dotfiles/tree/master/.config/karabiner)

## macos.sh

```
$ chmod +x ./macos.sh
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

- ssh configuration, see [this](https://github.com/ZhenpengWu/dotfiles/tree/master/.ssh)

## .config

### iTerm2

- iTerm2 configuration, see [this](https://github.com/ZhenpengWu/dotfiles/tree/master/.config/iterm2)

### RIME / Squirrel

- copy Rime configuration from `.config` folder to `Library` folder

```
$ ln -s ${HOME}/.config/Rime ${HOME}/Library/Rime
```

- remove the input source or input sources you want to disable from the `AppleEnabledInputSources` dictionary

```
$ open ${HOME}/Library/Preferences/com.apple.HIToolbox.plist
```

### Alfred

- Minimal/Minimal Dark Alfred theme preferences

### Dash

- Dash preferences
- Some snippets

## git

- set the global gitignore

```
$ git config --global core.excludesfile ${HOME}/.gitignore_global
```
