# export PATH=$HOME/bin:/usr/local/bin:$PATH
# If you come from bash you might have to change your $PATH.

# Homebrew shell completion (needs to be before oh-my-zsh call)
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

# Path to your oh-my-zsh installation.
export ZSH=/Users/mac/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

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

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

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

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"



# BASH_PROFILE
#export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "

#export CLICOLOR=1

#export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFha'
alias cl='clear'

# DIRECTORIES

alias gm='cd ~/Music'
alias gd='cd ~/Documents'
alias gp='cd ~/Pictures'
alias gn='cd ~/Dropbox/Apps/neutriNote'
alias vv='cd ~/NOTES/'
alias ww='cd ~/Dropbox/DOCS/wetwork'
alias vm='cd /Volumes/My\ Book/Media'
alias vol='cd /Volumes'
alias cp='rsync --archive --human-readable --progress --verbose --whole-file'

# CONFIGS
alias cfb='vim ~/.bash_profile'
alias cfv='vim ~/.vimrc'
alias cfr='vim ~/.config/ranger/rc.conf'
#alias cfm='vim ~/.mpd/mpd.conf'
alias cfn='vim ~/.ncmpcpp/config'
alias cfz='vim ~/.zshrc'
#alias cfs='vim ~/.slate'
alias cfm='vim ~/.config/mc/ini'
alias cfabl='vim /Users/mac/Library/Preferences/Ableton/Live\ 9.2.3/options.txt'
alias cfs='vim /Users/mac/Dropbox/Apps/neutriNote/CV/0_sprint.4_summer.19.md'

# CLI APPS
alias mus='ncmpcpp'
alias r='ranger'
alias ydl='youtube-dl --no-playlist --extract-audio --audio-format mp3'
alias vims='sudo vim'
alias мшь='vim'
alias f='open -a Finder .'
alias myip="curl http://myip.dnsomatic.com && echo ''"
#alias ctags="/usr/local/bin/ctags"
alias wgeth='wget --html-extension --page-requisites'
alias pandoch='pandoc -f html -t epub3'
alias beets='beet'

# FILEWORKS
alias greml='grep -E -o "\b[a-zA-Z0-9.-]+@[a-zA-Z0-9.-]+\.[a-zA-Z0-9.-]+\b"' # *.md >> file.md
#alias grek='grep -E -o "[0-9a-zA-Z-]+\.[0-9a-zA-Z-]+\.[0-9]+" ~/Dropbox/Apps/neutriNote/bib/Aspiro_1.8.bib | sort | uniq > ~/.vim/keywords.txt'

# -h нужно, чтобы при grep'е нескольких файлов strings не предварялись названиями файлов
alias grek='grep -h -E -o "[0-9a-zA-Z-]+\.[0-9a-zA-Z-]+\.[0-9]+" ~/Dropbox/Apps/neutriNote/bib/Aspiro_1.8.bib ~/Dropbox/Apps/neutriNote/bib/SFI_1.0.bib | sort | uniq > ~/.vim/keywords.txt'

## эта часть понадобится для references (ссылок на главы и разделы), но я пока это не использую:
## ~/Dropbox/Apps/neutriNote/bib/SFI_1.0.bib && rg -oN --no-filename "\{\#[^\d|\#|}]+\}" ~/Dropbox/Apps/neutriNote/Aspiro/dis_4.0/* | sed s/#// | sort | uniq > ~/.vim/references.txt'

alias awtime='awk -F "," "{print \$2,\$5,\$4,\$8, \$9, \$10, \$11,\$12}"'

### alias t='tagedit.sh "$@"'

alias o='open -a Finder "$@"'

# MPC MUSIC

# test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

alias mm='mpc add "$@" && mpc next && mpc play'

# PICS
alias ql='qlmanage -p "$@" &>/dev/null'
### qlm () { exiftool -if '$Composer =~ /G\./' *.mp3 . | qlmanage -p $1 &>/dev/null ; }
alias Tcy="exiftool -FileName -T . -if '$Comment eq"

#function Tcy() {
#	exiftool -if '$Comment eq "$1"' -FileName -T . 
#}

#alias blah='function _blah(){ exiftool -if '\''$Comment eq "$1"'\'' -FileName -T . -o $2 ; };_blah'
#alias example='f() { exiftool -if '\''$Comment eq "$1"'\'' -FileName -T . -o $2. };f'

#alias Tcy='exiftool -if '\''$Comment eq background'\'' -FileName -T .'
#Tcy "$1" "2"

#alias Tcy='Tcy $1 $2'

# FIND
# alias f.='find . -name "$@"'
# f.() { find . -name "*$@*" ; }
function f.() { find . -iname "*$1*" ${@:2} }
function g.() { grep "$1" ${@:2} -R . }


# CONSOLE COMMANDS
alias d.="du -h . | grep '[0-9\,]\+G'"
function s() { pwd > ~/.save_dir }

alias vrf="/Users/mac/bin/vrf"

# CONVERTING IMAGES
alias png2tiff='for f in *.png; do convert "$f" "${f%%.*}.tiff"; done'

# CONVERTING MUSIC AND AUDIO:
function 2mp3() { ffmpeg -i "$1" -ab 320k "${@:2}" }
fbatch () {
    find -type f -name "*.$1" -print0 | while read -d $'\0' a
    do
        ffmpeg -i "$a" -qscale:a 0 "${a[@]/%$1/$2}" < /dev/null
    done
    rm -I "*.$1"
}

# extracting audio f video
function ffstrip() { ffmpeg -i "$1"  -vn -acodec copy "$2" }

# extracting from particular timestamp (формат: -ss 00:03:05 -t 00:00:45.0)
function ffsstrip() { ffmpeg -i "$3"  -vn -acodec copy -ss "$1" -t "$2" "$4" }

alias ffmbatch="/bin/ffmpeg-batch.sh"


alias feh='feh \
           --scale-down \
           --auto-zoom \
           --borderless \
           --image-bg black \
           --draw-filename \
           --draw-tinted \
           --keep-zoom-vp \
           --magick-timeout 1'

. `brew --prefix`/etc/profile.d/z.sh


# FINK
source /sw/bin/init.sh

# MC
alias mc='. ~/bin/mc-wrapper.sh'

#
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANG=ru_RU.utf8

sh ~/bin/day-script.sh


# GIT
#alias diff="git diff --no-index --color-words --word-diff"
alias diff="git diff -U2000 --no-index --word-diff $1 $2"

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

function gitp() {
    git add .
    git commit -a -m "$1"
    git push
}


# DJVULIBRE path
eval `/Applications/DjView.app/Contents/setpath.sh`
# Convert djvu2pdf:
#ddjvu -format=pdf азбука.{djvu,pdf}
export PATH="/usr/local/sbin:$PATH"

# RUST
source ~/.cargo/env

# VIM ALIASES
#alias virg='vim `rg -l "$1" | fzf` -c "set foldlevel=1000 | /$1"'

function virg() {
	SEARCH="$(rg -l $1 | fzf -m --height 96% --reverse --preview "cat {}")" &&
		vim `echo ${SEARCH}` -O -c "set foldlevel=1000 | /$1"
}

function vif() {
	SEARCH="$(fzf -m --height 96% --reverse --preview "cat {}")" &&
		vim `echo ${SEARCH}` -c "set foldlevel=1000 | /$1"
}

# BREW
export HOMEBREW_NO_AUTO_UPDATE=1
## troubleshooting brew cleanup
alias brew cleanup="echo \"You don't want to do that. Just run 'cleanup' on specific packages, never on icu4c (this breaks vim) or boost (mpd, ncmpcpp)\""

# mdmail
#alias mdm="ranNum=$[RANDOM%998+1] bash -c 'vim ~/Dropbox/Apps/neutriNote/Appr/letters/letter_$ranNum.md'"
#alias mdm="ranNum=$(date +%S%N) vim ~/Dropbox/Apps/neutriNote/Appr/letters/letter_$ranNum.md"
#alias mdm="vim ~/Dropbox/Apps/neutriNote/Appr/letters/letter`date +"%S%N"`.md"
alias mdm="vim ~/Dropbox/Apps/neutriNote/Appr/letters/letter_`date +%F`._$RANDOM.md && exec $SHELL"

# SOX
snorm() {
	for file in *.*; do
		sox $file --norm=-0.1 ./NORM$file -V;
	done
}

# CALIBRE

alias calibre2ep="/Applications/calibre.app/Contents/MacOS/ebook-convert $1 $2 --dont-split-on-page-breaks --flow-size 260 --pretty-print"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# RTM-CLI
alias rtm="rtm --completed false"

# ConCATenate  * >> disserFull
alias ciss="cat /Users/mac/Dropbox/Apps/neutriNote/Aspiro/dis_5.0/{1..4}* > /Users/mac/Dropbox/Apps/neutriNote/Aspiro/dis_5.0/disserFull_1.2.md"

# textcleaner script
alias txcl="~/bin/textcleaner.sh"

# fish logo (not working)
logo() {
    echo "                 '(set_color F00)'___
  ___======____='(set_color FF7F00)'-'(set_color FF0)'-'(set_color FF7F00)'-='(set_color F00)')
/T            \_'(set_color FF0)'--='(set_color FF7F00)'=='(set_color F00)')
[ \ '(set_color FF7F00)'('(set_color FF0)'0'(set_color FF7F00)')   '(set_color F00)'\~    \_'(set_color FF0)'-='(set_color FF7F00)'='(set_color F00)')
 \      / )J'(set_color FF7F00)'~~    \\'(set_color FF0)'-='(set_color F00)')
  \\\\___/  )JJ'(set_color FF7F00)'~'(set_color FF0)'~~   '(set_color F00)'\)
   \_____/JJJ'(set_color FF7F00)'~~'(set_color FF0)'~~    '(set_color F00)'\\
   '(set_color FF7F00)'/ '(set_color FF0)'\  '(set_color FF0)', \\'(set_color F00)'J'(set_color FF7F00)'~~~'(set_color FF0)'~~     '(set_color FF7F00)'\\
  (-'(set_color FF0)'\)'(set_color F00)'\='(set_color FF7F00)'|'(set_color FF0)'\\\\\\'(set_color FF7F00)'~~'(set_color FF0)'~~       '(set_color FF7F00)'L_'(set_color FF0)'_
  '(set_color FF7F00)'('(set_color F00)'\\'(set_color FF7F00)'\\)  ('(set_color FF0)'\\'(set_color FF7F00)'\\\)'(set_color F00)'_           '(set_color FF0)'\=='(set_color FF7F00)'__
   '(set_color F00)'\V    '(set_color FF7F00)'\\\\'(set_color F00)'\) =='(set_color FF7F00)'=_____   '(set_color FF0)'\\\\\\\\'(set_color FF7F00)'\\\\
          '(set_color F00)'\V)     \_) '(set_color FF7F00)'\\\\'(set_color FF0)'\\\\JJ\\'(set_color FF7F00)'J\)
                      '(set_color F00)'/'(set_color FF7F00)'J'(set_color FF0)'\\'(set_color FF7F00)'J'(set_color F00)'T\\'(set_color FF7F00)'JJJ'(set_color F00)'J)
                      (J'(set_color FF7F00)'JJ'(set_color F00)'| \UUU)
                       (UU)'(set_color normal) "
	       }
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --no-ignore-vcs'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_COMPLETION_TRIGGER='~~'
export FZF_DEFAULT_OPTS='--height 96% --reverse --preview "cat {}"'
