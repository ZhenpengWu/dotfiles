# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/AKIRA/.oh-my-zsh
export ZSH_CUSTOM=$ZSH/custom
export PATH="/usr/local/sbin:$PATH"
export PATH="$PATH:$HOME/.npm-packages"
export PATH="$PATH:$HOME/.npm-packages/lib"
export PATH="/usr/local/texlive/2018/bin:$PATH"
export PATH="/usr/local/opt/node@8/bin:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

# language
export LANG=en_US.UTF-8

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# spaceship
source "$ZSH/custom/themes/spaceship.zsh-theme"
ZSH_THEME="spaceship"
SPACESHIP_CHAR_SYMBOL=$'\ue007 '
SPACESHIP_CHAR_SYMBOL_SECONDARY=$'\ue007 '
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
SPACESHIP_USER_SHOW=true
SPACESHIP_BATTERY_SHOW=false

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
plugins=(git
         k
         autojump
         virtualenv
         zsh-autosuggestions
         zsh-completions
         zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# aiases
alias ohmyzsh="emacs ~/.oh-my-zsh"
alias e='emacs -nw'
alias t='tmux attach -t base || tmux new -s base'
alias code="code-insiders"
eval $(thefuck --alias)
alias vim=nvim

erl() {
	/usr/local/bin/erl erl -eval 'code:add_path("/Users/AKIRA/Desktop/CPSC 418/erl")' "$@"
}

ok() {
	cmatrix -a -s -b
}

handin() {
    if  [ "$1" != "" ] && [ "$2" != "" ] # or better, if [ -n "$1" ]
    then 
        rsync -ra . w8j0b@thetis.ugrad.cs.ubc.ca:~/"$1"/"$2"
    else
        echo "handin course# hw#";
    fi
}
