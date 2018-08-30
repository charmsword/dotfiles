
#export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "

#export CLICOLOR=1

#export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFha'


# DIRECTORIES

alias h='cd ~/'
alias m='cd ~/Music'
alias d='cd ~/Documents'
alias p='cd ~/Pictures'
alias v='cd ~/Dropbox/Apps/neutriNote'


# CONFIGS
alias cfb='vim ~/.bash_profile'
alias cfv='vim ~/.vimrc'
alias cfr='vim ~/.config/ranger/rc.conf'
alias cfm='vim ~/.mpd/mpd.conf'
alias cfn='vim ~/.ncmpcpp/config'
alias cfs='vim ~/.slate'

# APPS
alias mus='ncmpcpp'
alias r='ranger'
alias ydl='youtube-dl --extract-audio --audio-format mp3'

# FILEWORKS
alias greml='grep -E -o "\b[a-zA-Z0-9.-]+@[a-zA-Z0-9.-]+\.[a-zA-Z0-9.-]+\b"' # *.md >> file.md

### alias t='tagedit.sh "$@"'

alias o='open -a Finder "$@"'

# MPC MUSIC

# test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

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
f.() { find . -name "*$@*" ; }


# CONSOLE COMMANDS
alias d.='du -h . | grep '/''[0-9\,]\+G'/'''
s() { pwd > ~/.save_dir ; }

# CONVERTING MUSIC AND AUDIO:
function 2mp3 () { ffmpeg -i "$1" -ab 320k "$2" ; }



alias feh='feh \
           --scale-down \
           --auto-zoom \
           --borderless \
           --image-bg black \
           --draw-filename \
           --draw-tinted \
           --keep-zoom-vp \
           --magick-timeout 1'

export PATH="$HOME/.cargo/bin:$PATH"
