# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/AKIRA/.oh-my-zsh

# Theme
source "$ZSH/custom/themes/spaceship.zsh-theme"
ZSH_THEME="spaceship"
SPACESHIP_CHAR_SYMBOL='⸖'
SPACESHIP_CHAR_SUFFIX=' '
SPACESHIP_BATTERY_SHOW=false
SPACESHIP_PACKAGE_SYMBOL="❐ "

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

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# plugins
plugins=(git
         k
         autojump
         zsh-autosuggestions
         zsh-completions
         zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# language
export LANG=en_US.UTF-8

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# aiases
alias ohmyzsh="emacs ~/.oh-my-zsh"
alias e='emacs -nw'
alias t=touch
alias code="code-insiders"
eval $(thefuck --alias)
alias vim=nvim
export PATH="/usr/local/sbin:$PATH"
function erl {
	/usr/local/bin/erl erl -eval 'code:add_path("/Users/AKIRA/Desktop/CPSC 418/erl")' "$@"
}

handin() {
    if  [ "$1" != "" ] && [ "$2" != "" ] # or better, if [ -n "$1" ]
    then 
        rsync -ra . w8j0b@thetis.ugrad.cs.ubc.ca:~/"$1"/"$2"
    else
        echo "handin course# hw#";
    fi
}

export PATH="$PATH:$HOME/.npm-packages/bin"
export PATH="$PATH:$HOME/.npm-packages/lib"
export PATH="/usr/local/texlive/2018/bin:$PATH"
export PATH="/usr/local/opt/node@8/bin:$PATH"
