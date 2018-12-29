# dotfiles

- mpv
- karabiner
- hammerspoon
- iterm2
- dash
- brew 
- osx
- aria2
- ssh
- alfred

## zsh & .oh-my-zsh

### themes: spaceship-prompt

```
git clone https://github.com/denysdovhan/spaceship-prompt.git $ZSH_CUSTOM/themes/spaceship-prompt
```

### plugins: zsh-autosuggestions

```
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
```

### plugins: zsh-completions

```
git clone https://github.com/zsh-users/zsh-completions $ZSH_CUSTOM/plugins/zsh-completions
```

### plugins: zsh-syntax-highlighting

```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
```

## .tmux

```
$ ln -s -f .tmux/.tmux.conf
$ cp .tmux/.tmux.conf.local .
```
