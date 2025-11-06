####################################
##                                ##
##  @@@@@@@@   @@@@@@   @@@  @@@  ##
##  @@@@@@@@  @@@@@@@   @@@  @@@  ##
##       @@!  !@@       @@!  @@@  ##
##      !@!   !@!       !@!  @!@  ##
##     @!!    !!@@!!    @!@!@!@!  ##
##    !!!      !!@!!!   !!!@!!!!  ##
##   !!:           !:!  !!:  !!!  ##
##  :!:           !:!   :!:  !:!  ##
##   :: ::::  :::: ::   ::   :::  ##
##  : :: : :  :: : :     :   : :  ##
##                                ##
####################################

### Core env
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="jonathan" # to set to random theme, set to "random"
# to pull form a SET of random themes, set the above and uncomment the below line:
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" "ys" "simple" "jonathan")
plugins=(git)
# Load OMZ after plugins/theme are set
source "$ZSH/oh-my-zsh.sh"

### Path (deduped and ordered)
typeset -U path PATH
path=(
  "$HOME/bin"
  "$HOME/.local/bin"
  /usr/local/bin
  "$HOME/.lmstudio/bin"
  $path
)

### Shell behaviour
setopt autocd              # `cd` by typing dir name
setopt interactivecomments # allow comments at prompt
setopt inc_append_history  # write commands immediately
setopt share_history       # share history across sessions
setopt hist_ignore_all_dups
setopt hist_verify
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000
HIST_STAMPS="yyyy-mm-dd"

### Editor
export EDITOR='nvim'
export VISUAL='nvim'

### zoxide (smart cd)
eval "$(zoxide init zsh)"

### Aliases and functions

# eza if available, else sensible ls fallbacks
if command -v eza >/dev/null 2>&1; then
  alias ls='eza -aF --group-directories-first'
  alias ll='eza -al --group-directories-first'
  alias lt='eza -al --sort=modified'
  alias lf='eza --only-files -l'
  alias ld='eza -LD'
  alias lh='eza -a -ld .*'
else
  # BSD/GNU compatible flags
  alias ls='ls -AF'
  alias ll='ls -Al'
  alias lt='ls -AlT'
fi

# Navigation
alias h='cd "$HOME"'
alias hc='cd "$HOME" && clear'
alias c='clear'

alias seshfind='cd Desktop/tmuxSessionFinder'

# Quick editors
alias zedit='nvim ~/.zshrc'
alias tmuxedit='nvim ~/.tmux.conf'
alias zource='source ~/.zshrc'

# Neovim mapping
alias vi='nvim'
alias vim='nvim'
alias VI='nvim'
alias VIM='nvim'
alias theinvincibleeditor='nvim'

# Tmux helpers
alias tls='tmux ls | fzf'
tm() { tmux new -A -s "${1:-main}"; }


# Enable fuzzy completion and history search
#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
###export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
#export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'


# Project jumps (check path exists first)
pdfsplit()   { cd "$HOME/Desktop/invoicesplitter" || return; }
internal()   { cd "$HOME/Library/CloudStorage/OneDrive-NexioLimited/Documents/Private Quick/Clients/internal" || return; }
claudedit()  { cd "$HOME/.claude" && nvim CLAUDE.md; }
clodesearch(){ cd "$HOME/claudecoderesearch" || return; }
