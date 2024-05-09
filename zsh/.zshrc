# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="intheloop"

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

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
plugins=(git colored-man-pages command-not-found common-aliases copypath cp docker dotenv emacs zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# PATH with Doom emacs and Go bin
export PATH="$PATH:$HOME/.config/emacs/bin:$HOME/go/bin"
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export PATH="$PATH:$HOME/.config/v-analyzer/bin"

export PATH="$PATH:/home/slashiy/.local/bin"

alias vim="nvim"
VIM="nvim"
export PROJECTS="/mnt/data/Projects"

source ~/.railway_completion

# Function to navigate to the selected folder
function navigate_to_folder() {
  cd "$1"
  zle -I
}

typeset -A folder_map

# Array of folders you want to navigate to
folders=()

function get_project_folders() {
  local folder
  local alias
  folder_map=()  # Clear previous entries

  while IFS= read -r -d '' folder; do
    if [[ "$folder" != "$PROJECTS" ]]; then
      alias=$(basename "$folder")  # Get just the folder name
      alias=${(C)alias}  # Capitalize the first letter in Zsh
      folder_map[$alias]=$folder  # Map alias to full path
    fi
  done < <(find "$PROJECTS" -maxdepth 1 -mindepth 1 -type d -print0)
}



# Function to run the folder selection script
function select_and_cd_folder() {
  get_project_folders  # Populate folder_map array
  local selected_alias
  selected_alias=$(printf '%s\n' "${(@k)folder_map}" | fzf)  # Using fzf to select a folder alias
  
  if [[ -n "$selected_alias" ]]; then
    navigate_to_folder "$folder_map[$selected_alias]"
  fi
}

# Create a zsh keybind to call the function on Ctrl+Shift+F
zle -N select_and_cd_folder
bindkey '^F' select_and_cd_folder

# bun completions
[ -s "/home/slashiy/.bun/_bun" ] && source "/home/slashiy/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Created by `pipx` on 2023-09-09 19:55:38

# [[ "$TERM" == "xterm-kitty" ]] && alias ssh="TERM=xterm-256color ssh"
#
alias ssh="TERM=xterm-256color ssh"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# opam configuration
[[ ! -r /home/slashiy/.opam/opam-init/init.zsh ]] || source /home/slashiy/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

if command -v gh &> /dev/null; then
  gh auth setup-git
fi

[[ -s "/opt/asdf-vm/asdf.sh" ]] && . /opt/asdf-vm/asdf.sh
