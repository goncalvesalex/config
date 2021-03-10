# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Greetings
screenfetch

# Prompt
PS1="\u@\h:\\w\[\e[36m\]\$(parse_git_branch)\[\e[00m\]$ "

# History
HISTCONTROL=ignoredups:erasedups
HISTSIZE=100000
HISTFILESIZE=100000           
PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

shopt -s histappend

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\eOA": history-search-backward'
bind '"\eOB": history-search-forward'

# Alias
alias ls='ls --color=auto'
alias ll='ls -lh'
alias vi="vim"
alias vim="vim"
alias gf="git fetch"
alias gp="git stash; git pull --rebase; git stash pop"
alias gs="git status"
alias du="du -h -d1"
alias df="df -h"
alias tig="tig --no-merges"

# Functions
parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/|\1/'
}

vpn_start() {
	sudo snx -d 
	sudo snx -s vpnpt.fabamaq.com -u alexandre.goncalves
}

function extract {
 if [ -z "$1" ]; then
    echo "Usage: extract file_name"
 else
    for n in "$@"
    do
      if [ -f "$n" ] ; then
          case "${n%,}" in
            *.cbt|*.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar) 
                         tar xvf "$n"       ;;
            *.lzma)      unlzma ./"$n"      ;;
            *.bz2)       bunzip2 ./"$n"     ;;
            *.cbr|*.rar) unrar x -ad ./"$n" ;;
            *.gz)        gunzip ./"$n"      ;;
            *.cbz|*.epub|*.zip) unzip ./"$n"       ;;
            *.z)         uncompress ./"$n"  ;;
            *.7z|*.apk|*.arj|*.cab|*.cb7|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.pkg|*.rpm|*.udf|*.wim|*.xar)
                         7z x ./"$n"        ;;
            *.xz)        unxz ./"$n"        ;;
            *.exe)       cabextract ./"$n"  ;;
            *.cpio)      cpio -id < ./"$n"  ;;
            *.cba|*.ace) unace x ./"$n"      ;;
            *.zpaq)      zpaq x ./"$n"      ;;
            *.arc)       arc e ./"$n"       ;;
            *.cso)       ciso 0 ./"$n" ./"$n.iso" && \
                              extract $n.iso && \rm -f $n ;;
            *)
                         echo "extract: '$n' - unknown archive method"
                         return 1
                         ;;
          esac
      else
          echo "'$n' - file does not exist"
          return 1
      fi
    done
fi
}

