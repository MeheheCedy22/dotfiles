# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples


#_____________________________________________________________________________________________
### my special settings ###
PATH="$HOME/.cargo/bin${PATH:+:${PATH}}"
PATH="/usr/bin/gdb${PATH:+:${PATH}}"
#   PATH="/usr/lib/jvm/jdk-18/bin${PATH:+:${PATH}}" #pridane aby fungoval javac v celom systeme
#   PATH="/opt/thunderbird${PATH:+:${PATH}}"

# Random colored pictire when launching terminal
#   colorscript -r

#starship better shell prompt
eval "$(starship init bash)"
#_____________________________________________________________________________________________


# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


#_____________________________________________________________________________________________
### my aliases ###

# for eza -h flag means header, not human readable
#   alias lss='ls -alh1 --group-directories-first'
# exa replaced by eza (exa is no longer maintained, eza is community fork of exa)
alias lss='eza -alh --color=always --group-directories-first'
alias cls='clear'
alias watchvpn='watch -n 1 "hotspotshield status"'

alias aptup="sudo apt update && sudo apt upgrade"
alias aptupd="sudo apt update"
alias aptupg="sudo apt upgrade"

alias nalaup="sudo nala update && sudo nala upgrade"
alias nalaupd="sudo nala update"
alias nalaupg="sudo nala upgrade"

alias val="sudo valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes -s ./a.out"
alias compilePLS="g++ -Wall -Wformat -Wextra -Wno-unused-parameter -Wno-unused-variable -Wno-unused-function -Wno-missing-field-initializers *.cpp -o out_bin"
alias compilePLSdebug="g++ -Wall -Wformat -Wextra -Wno-unused-parameter -Wno-unused-variable -Wno-unused-function -Wno-missing-field-initializers -g *.cpp"
alias runPLS="./out_bin"
alias compileANDrunPLS="compilePLS && runPLS"
alias compileANDvalPLS="compilePLS && val"

# only for old lenovo legion Y520 laptop
#   alias battery_treshold_on="sudo cp ~/tlp-battery-treshold-activator-me/conservation_mode_1 /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode"
#   alias battery_treshold_off="sudo cp ~/tlp-battery-treshold-activator-me/conservation_mode_0 /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode"

# clipboard manager in terminal
#   alias cb='flatpak run app.getclipboard.Clipboard'

alias qr='generate_qr_code'
generate_qr_code() {
  curl "qrenco.de/$1"
}

alias cheat='cheat_curl_help'
cheat_curl_help() {
curl "cht.sh/$1"
}


# not needed because of package python-is-python3
#   alias python='python3'


#   source ~/.bash_completion/alacritty
#_____________________________________________________________________________________________



