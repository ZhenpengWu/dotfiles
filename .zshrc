# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$ZSH/custom
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.npm-packages/bin:$PATH"
export PATH="$HOME/.npm-packages/lib:$PATH"
export PATH="/usr/local/texlive/2019/bin:$PATH"
export PATH="/usr/local/opt/node@12/bin:$PATH"
# export PATH="/usr/local/opt/node/bin:$PATH"
# export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

# export CPATH=/Library/Developer/CommandLineTools/SDKs/MacOSX11.1.sdk/System/Library/Perl/5.28/darwin-thread-multi-2level/CORE:$CPATH
# export PATH="/usr/local/opt/perl/bin:$PATH"

# language
export LANG=en_US.UTF-8

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# spaceship
source "$ZSH/custom/themes/spaceship.zsh-theme"
# ZSH_THEME="spaceship"
ZSH_THEME=powerlevel10k/powerlevel10k
SPACESHIP_CHAR_SYMBOL=$'\uf641 '
SPACESHIP_CHAR_SYMBOL_SECONDARY=$'\uf641  '
SPACESHIP_PACKAGE_SYMBOL=$'\uf487 '
SPACESHIP_NODE_SYMBOL=$'\uf898 '
SPACESHIP_RUBY_SYMBOL=$'\ue21e '
SPACESHIP_ELM_SYMBOL=$'\ue62c '
SPACESHIP_ELIXIR_SYMBOL=$'\ue62d '
SPACESHIP_SWIFT_SYMBOL=$'\ufbe3 '
SPACESHIP_GOLANG_SYMBOL=$'\ufcd1 '
SPACESHIP_PHP_SYMBOL=$'\ue608 '
SPACESHIP_RUST_SYMBOL=$'\ue7a8 '
SPACESHIP_HASKELL_SYMBOL=$'\ue61f '
SPACESHIP_JULIA_SYMBOL=$'\ue624 '
SPACESHIP_DOCKER_SYMBOL=$'\uf308 '
SPACESHIP_AWS_SYMBOL=$'\ue7ad '
SPACESHIP_PYENV_SYMBOL=$'\ue606 '
SPACESHIP_DOTNET_SYMBOL=$'\ue72e '
SPACESHIP_EMBER_SYMBOL=$'\ue71b '
SPACESHIP_TERRAFORM_SYMBOL=$'\uf425 '
SPACESHIP_XCODE_SYMBOL=$'\uf425 '
SPACESHIP_DIR_LOCK_SYMBOL=$' \uf83d '
SPACESHIP_GIT_SYMBOL=$'\ufb2b '
SPACESHIP_GIT_BRANCH_PREFIX=$'\ufb2b '
SPACESHIP_USER_SHOW=true
SPACESHIP_BATTERY_SHOW=false
SPACESHIP_PROMPT_ADD_NEWLINE=true
SPACESHIP_CHAR_SUFFIX=(" ")
SPACESHIP_PROMPT_DEFAULT_PREFIX='$USER'
SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=true

source $(dirname $(gem which colorls))/tab_complete.sh

# Command auto-correction.
# ENABLE_CORRECTION="true"

# Command execution time stamp shown in the history command output.
HIST_STAMPS="mm/dd/yyyy"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

ZSH_DISABLE_COMPFIX="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirt. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# plugins
plugins=(
    git
    autojump
    history-substring-search
    zsh-autosuggestions
    zsh-completions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# aiases
alias ohmyzsh="emacs ~/.oh-my-zsh"
alias e='emacs -nw'
alias t='tmux attach -t base || tmux new -s base'
alias vim=nvim
# alias top=gtop
alias py3=python3

alias l='colorls -1'
alias ll='colorls -la'
alias la='colorls -la'
alias ls='colorls -1 -l'
alias lg='colorls -1 -l --gs --tree'

eval $(thefuck --alias)

ok() {
    cmatrix -a -s -b
}

# export PATH = "$PATH:/usr/local/Cellar/perl/5.28.0/bin"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
