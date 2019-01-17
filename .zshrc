# -- Variables
export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE=~/.histfile 
export HISTTIMEFORMAT='%F %T '
# export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""' # fzf: find hidden
export FZF_DEFAULT_OPS='--extended'
export PATH=${PATH}:$HOME/.SAPClients/SAPGUI/bin/guilogon
export PATH=${PATH}:$HOME/.amplide_linux64/amplide/amplide

export ORACLE_HOME=/usr/lib/oracle/product/11.2.0/xe
export ORACLE_SID=XE
export NLS_LANG=`$ORACLE_HOME/bin/nls_lang.sh`
export PATH=$PATH:$ORACLE_HOME/bin




# -- history 
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_BEEP
setopt extended_glob
setopt inc_append_history

# -- "dir" instead of "cd dir"
setopt AUTO_CD



# -- move files to .Trash, or when "-rf" is set remove files entirely
function moveTrash() {
if [[ "$1" == "-rf" ]]; then
    rm -rf "${@:2}"
else
    for i in "$@"; do
        cp -r -t ~/.Trash $i && rm -rf $i
    done

fi
}


# -- load stuff
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
source $HOME/.vi-mode.zsh # responsible for the prompt
source /usr/share/LS_COLORS/dircolors.sh # via: lscolors-git
zstyle ':completion:*' rehash true


# -- ci"
autoload -U select-quoted
zle -N select-quoted
for m in visual viopp; do
  for c in {a,i}{\',\",\`}; do
    bindkey -M $m $c select-quoted
  done
done

# -- ci{, ci(
autoload -U select-bracketed
zle -N select-bracketed
for m in visual viopp; do
  for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
    bindkey -M $m $c select-bracketed
  done
done

# -- surround
autoload -Uz surround
zle -N delete-surround surround
zle -N add-surround surround
zle -N change-surround surround
bindkey -a cs change-surround
bindkey -a ds delete-surround
bindkey -a ys add-surround
bindkey -M visual S add-surround

# -- some keybinds
bindkey ",f" fzf-history-widget #fzf history search, as you would do in vim
bindkey "^[[A" history-beginning-search-backward # completion based on input
bindkey "^[[B" history-beginning-search-forward  # completion based on input   




# -- Alias
alias down="cd ~/.down"
alias i="sxiv -qopt . | xclip" #in sxix: mark files with "m", close with "q" -> auto copy files to clipboard
alias kill='killall -9'
alias ncdu="ncdu --color dark" #Tui alternative of 'du'
alias p="exit"
alias pdf="zathura"
alias q="clear"
alias rm="moveTrash"
alias trans="trans -show-original-dictionary y" #translate from commandline
alias wp="nitrogen ~/media/wallpapers"  #set up a new wallpaper
alias x="dtrx"
alias xclip='xclip -selection clipboard'
alias xp='xprop | grep "WM_WINDOW_ROLE\|WM_CLASS" && echo "WM_CLASS(STRING) = \"NAME\", \"CLASS\""' #class name of window



# -- obsolete
# alias decrypt="/usr/bin/decrypt.sh"
# alias gl='git log --pretty=format:"%h%x09%an%x09%ad%x09%s"'
# alias merge='pdftk *.pdf cat output' # USAGE: merge output_name.pdf
