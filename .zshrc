# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="spaceship"

fpath=(/usr/local/share/zsh/site-functions $fpath)

autoload -U promptinit; promptinit
#prompt spaceship

# The order of the prompt components.
#SPACESHIP_PROMPT_ORDER=(
#  user          # Username section
#  dir           # Current directory section
#  host
#  venv          # virtualenv section
#  git           # Git section (git_branch + git_status)
#  package       # Package version
#  pyenv         # Pyenv section
#  exec_time     # Execution time
#  line_sep      # Line break
#  char          # Prompt character
#)


SPACESHIP_PROMPT_ORDER=(
  time     #
  vi_mode  # these sections will be
  user     # before prompt char
  host     #
  char
  dir
  git
  exec_time
  node
  ruby
  xcode
  swift
  golang
  docker
  venv
  pyenv
)

SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_CHAR_SUFFIX=' '
SPACESHIP_CHAR_SYMBOL='➜'
SPACESHIP_CHAR_SYMBOL_ROOT='ム'
SPACESHIP_USER_SHOW=always
SPACESHIP_USER_COLOR=red

SPACESHIP_HOST_SHOW=always
SPACESHIP_HOST_SUFFIX=' '
SPACESHIP_HOST_PREFIX='@'
#SPACESHIP_HOST_SUFFIX=' '
SPACESHIP_HOST_COLOR=green

SPACESHIP_PROMPT_ADD_NEWLINE=true
# workaround to remove bold from prompt
# https://github.com/denysdovhan/spaceship-prompt/issues/426#issuecomment-576036367
() {
  local z=$'\0'
  PROMPT='${${${$(spaceship_prompt)//\%\%/'$z'}//\%B}//'$z'/%%}'
}



# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#export UPCLOUD_USERNAME=davidestaffieriapi
export UPCLOUD_USERNAME=davideapi123
export UPCLOUD_PASSWORD=Davide,123

echo 'export PATH=$PATH:$HOME/bin' >> ~/.zshrc
echo "export EDITOR='subl -w'" >> ~/.zshrc
export PATH=$PATH:$HOME/bin
export EDITOR='subl -w'
export PATH=$PATH:$HOME/bin
export EDITOR='subl -w'
export PATH=$PATH:$HOME/bin
export EDITOR='subl -w'
export PATH=$PATH:$HOME/bin
export EDITOR='subl -w'
export PATH=$PATH:$HOME/bin
export EDITOR='subl -w'
export PATH=$PATH:$HOME/bin
export EDITOR='subl -w'
export PATH=$PATH:$HOME/bin
export EDITOR='subl -w'
export PATH=$PATH:$HOME/bin
export EDITOR='subl -w'
export PATH=$PATH:$HOME/bin
export EDITOR='subl -w'
export PATH=$PATH:$HOME/bin
export EDITOR='subl -w'
export PATH=$PATH:$HOME/bin
export EDITOR='subl -w'
export PATH=$PATH:$HOME/bin
export EDITOR='subl -w'
export PATH=$PATH:$HOME/bin
export EDITOR='subl -w'
export PATH=$PATH:$HOME/bin
export EDITOR='subl -w'
export PATH=$PATH:$HOME/bin
export EDITOR='subl -w'
export PATH=$PATH:$HOME/bin
export EDITOR='subl -w'
export PATH=$PATH:$HOME/bin
export EDITOR='subl -w'
export PATH=$PATH:$HOME/bin
export EDITOR='subl -w'
export PATH=$PATH:$HOME/bin
export EDITOR='subl -w'
export PATH=$PATH:$HOME/bin
export EDITOR='subl -w'
export PATH=$PATH:$HOME/bin
export EDITOR='subl -w'
export PATH=$PATH:$HOME/bin
export EDITOR='subl -w'
export PATH=$PATH:$HOME/bin
export EDITOR='subl -w'
export PATH=$PATH:$HOME/bin
export EDITOR='subl -w'
export PATH=$PATH:$HOME/bin
export EDITOR='subl -w'
export PATH=$PATH:$HOME/bin
export EDITOR='subl -w'
export PATH=$PATH:$HOME/bin
export EDITOR='subl -w'
export PATH=$PATH:$HOME/bin
export EDITOR='subl -w'
export PATH=$PATH:$HOME/bin
export EDITOR='subl -w'
export PATH=$PATH:$HOME/bin
export EDITOR='subl -w'
export PATH=$PATH:$HOME/bin
export EDITOR='subl -w'
export PATH=$PATH:$HOME/bin
export EDITOR='subl -w'
export PATH=$PATH:$HOME/bin
export EDITOR='subl -w'
export PATH=$PATH:$HOME/bin
export EDITOR='subl -w'
export PATH=$PATH:$HOME/bin
export EDITOR='subl -w'
export PATH=$PATH:$HOME/bin
export EDITOR='subl -w'
export PATH=$PATH:$HOME/bin
export EDITOR='subl -w'
export PATH=$PATH:$HOME/bin
export EDITOR='subl -w'
export PATH=$PATH:$HOME/bin
export EDITOR='subl -w'
export PATH=$PATH:$HOME/bin
export EDITOR='subl -w'
export PATH=$PATH:$HOME/bin
export EDITOR='subl -w'
export PATH=$PATH:$HOME/bin
export EDITOR='subl -w'
export PATH=$PATH:$HOME/bin
export EDITOR='subl -w'
export PATH=$PATH:$HOME/bin
export EDITOR='subl -w'
export PATH=$PATH:$HOME/bin
export EDITOR='subl -w'
export PATH=$PATH:$HOME/bin
export EDITOR='subl -w'
export PATH=$PATH:$HOME/bin
export EDITOR='subl -w'
export PATH=$PATH:$HOME/bin
export EDITOR='subl -w'
export PATH=$PATH:$HOME/bin
export EDITOR='subl -w'
export PATH=$PATH:$HOME/bin
export EDITOR='subl -w'
export PATH=$PATH:$HOME/bin
export EDITOR='subl -w'
export PATH=$PATH:$HOME/bin
export EDITOR='subl -w'
export PATH=$PATH:$HOME/bin
export EDITOR='subl -w'
export PATH=$PATH:$HOME/bin
export EDITOR='subl -w'
export PATH=$PATH:$HOME/bin
export EDITOR='subl -w'
export PATH=$PATH:$HOME/bin
export EDITOR='subl -w'
export PATH=$PATH:$HOME/bin
export EDITOR='subl -w'
export PATH=$PATH:$HOME/bin
export EDITOR='subl -w'
export PATH=$PATH:$HOME/bin
export EDITOR='subl -w'
export PATH=$PATH:$HOME/bin
export EDITOR='subl -w'
export PATH=$PATH:$HOME/bin
export EDITOR='subl -w'
export PATH=$PATH:$HOME/bin
export EDITOR='subl -w'
export PATH=$PATH:$HOME/bin
export EDITOR='subl -w'
export PATH=$PATH:$HOME/bin
export EDITOR='subl -w'
export PATH=$PATH:$HOME/bin
export EDITOR='subl -w'
