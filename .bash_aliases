# Colours for less/man
#   http://blog.0x1fff.com/2009/11/linux-tip-color-enabled-pager-less.html
# 
#   Alternative less comand:
#     alias vless='/usr/share/vim/vimcurrent/macros/less.sh'
#
export LESS="-RSM~gIsw"
export LESS_TERMCAP_mb=$'\E[01;31m'     # begin blinking
export LESS_TERMCAP_md=$'\E[01;31m'     # begin bold
export LESS_TERMCAP_me=$'\E[0m'         # end mode
export LESS_TERMCAP_se=$'\E[0m'         # end standout-mode
export LESS_TERMCAP_so=$'\E[01;44;33m'  # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'         # end underline
export LESS_TERMCAP_us=$'\E[01;32m'     # begin underline


# Aliases
#   taken and uncommented from stock Debian Wheezy .bashrc

alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias ll='ls -l'
alias lla='ls -la'
alias la='ls -A'
alias l='ls -CF'

# Other aliases
alias ":q"="exit"


# Bunch-o-predefined colors.  Makes reading code easier than escape sequences.

# Reset
Color_Off="\[\033[0m\]"       # Text Reset

# Regular Colors
Black="\[\033[0;30m\]"        # Black
Red="\[\033[0;31m\]"          # Red
Green="\[\033[0;32m\]"        # Green
Yellow="\[\033[0;33m\]"       # Yellow
Blue="\[\033[0;34m\]"         # Blue
Purple="\[\033[0;35m\]"       # Purple
Cyan="\[\033[0;36m\]"         # Cyan
White="\[\033[0;37m\]"        # White

# Bold
BBlack="\[\033[1;30m\]"       # Black
BRed="\[\033[1;31m\]"         # Red
BGreen="\[\033[1;32m\]"       # Green
BYellow="\[\033[1;33m\]"      # Yellow
BBlue="\[\033[1;34m\]"        # Blue
BPurple="\[\033[1;35m\]"      # Purple
BCyan="\[\033[1;36m\]"        # Cyan
BWhite="\[\033[1;37m\]"       # White

# Underline
UBlack="\[\033[4;30m\]"       # Black
URed="\[\033[4;31m\]"         # Red
UGreen="\[\033[4;32m\]"       # Green
UYellow="\[\033[4;33m\]"      # Yellow
UBlue="\[\033[4;34m\]"        # Blue
UPurple="\[\033[4;35m\]"      # Purple
UCyan="\[\033[4;36m\]"        # Cyan
UWhite="\[\033[4;37m\]"       # White

# Background
On_Black="\[\033[40m\]"       # Black
On_Red="\[\033[41m\]"         # Red
On_Green="\[\033[42m\]"       # Green
On_Yellow="\[\033[43m\]"      # Yellow
On_Blue="\[\033[44m\]"        # Blue
On_Purple="\[\033[45m\]"      # Purple
On_Cyan="\[\033[46m\]"        # Cyan
On_White="\[\033[47m\]"       # White

# High Intensty
IBlack="\[\033[0;90m\]"       # Black
IRed="\[\033[0;91m\]"         # Red
IGreen="\[\033[0;92m\]"       # Green
IYellow="\[\033[0;93m\]"      # Yellow
IBlue="\[\033[0;94m\]"        # Blue
IPurple="\[\033[0;95m\]"      # Purple
ICyan="\[\033[0;96m\]"        # Cyan
IWhite="\[\033[0;97m\]"       # White

# Bold High Intensty
BIBlack="\[\033[1;90m\]"      # Black
BIRed="\[\033[1;91m\]"        # Red
BIGreen="\[\033[1;92m\]"      # Green
BIYellow="\[\033[1;93m\]"     # Yellow
BIBlue="\[\033[1;94m\]"       # Blue
BIPurple="\[\033[1;95m\]"     # Purple
BICyan="\[\033[1;96m\]"       # Cyan
BIWhite="\[\033[1;97m\]"      # White

# High Intensty backgrounds
On_IBlack="\[\033[0;100m\]"   # Black
On_IRed="\[\033[0;101m\]"     # Red
On_IGreen="\[\033[0;102m\]"   # Green
On_IYellow="\[\033[0;103m\]"  # Yellow
On_IBlue="\[\033[0;104m\]"    # Blue
On_IPurple="\[\033[10;95m\]"  # Purple
On_ICyan="\[\033[0;106m\]"    # Cyan
On_IWhite="\[\033[0;107m\]"   # White

# Various variables you might want for your PS1 prompt instead
Time12h="\T"
Time12a="\@"
PathShort="\w"
PathFull="\W"
NewLine="\n"
Jobs="\j"
ShortHost="\h"
Username="\u"

#######################################################################
# git prompt #1
#######################################################################

# Edited, based on http://brettterpstra.com/my-new-favorite-bash-prompt/
prompt_command () {
    #if [ $? -eq 0 ]; then # set an error string for the prompt, if applicable
        #ERRPROMPT=""
    #else
        #ERRPROMPT='-&gt;($?)'
    #fi
    if [ "\$(type -t __git_ps1)" ]; then # if we're in a Git repo, show current branch
        BRANCH="\$(__git_ps1 '[ %s ] ')"
    else
        BRANCH=""
    fi
    #local TIME=`fmt_time` # format time for prompt string
    #local LOAD=`uptime|awk '{min=NF-2;print $min}'`

    # set the titlebar to the last 2 fields of pwd
    #local TITLEBAR='\[\e]2;`pwdtail`\a'
    #export PS1="\[${TITLEBAR}\]${CYAN}[ ${BCYAN}\u${GREEN}@${BCYAN}\h${DKGRAY}(${LOAD}) ${WHITE}${TIME} ${CYAN}]${RED}$ERRPROMPT${GRAY}\w\n${GREEN}${BRANCH}${DEFAULT}$ "
    export PS1="\n${BCyan}\u${Cyan} on ${BCyan}\h${Cyan} in ${BCyan}\w ${Green}${BRANCH}\n${Color_Off}$ "
}
PROMPT_COMMAND=prompt_command
 
#fmt_time () { #format time just the way I likes it
    #if [ `date +%p` = "PM" ]; then
        #meridiem="pm"
    #else
        #meridiem="am"
    #fi
    #date +"%l:%M:%S$meridiem"|sed 's/ //g'
#}
#pwdtail () { #returns the last 2 fields of the working directory
    #pwd|awk -F/ '{nlast = NF -1;print $nlast"/"$NF}'
#}
#chkload () { #gets the current 1m avg CPU load
    #local CURRLOAD=`uptime|awk '{print $8}'`
    #if [ "$CURRLOAD" &gt; "1" ]; then
        #local OUTP="HIGH"
    #elif [ "$CURRLOAD" &lt; "1" ]; then
        #local OUTP="NORMAL"
    #else
        #local OUTP="UNKNOWN"
    #fi
    #echo $CURRLOAD
#}

#######################################################################
# git prompt #2
#######################################################################

# Customize BASH PS1 prompt to show current GIT repository and branch.
# by Mike Stewart - http://MediaDoneRight.com
# http://mediadoneright.com/content/ultimate-git-ps1-bash-prompt

# Modified by changes at:
# http://www.xenji.com/2012/04/git-bash-prompt.html

# SETUP CONSTANTS
#MyPS1=$IBlack$Username@$ShortHost$Color_Off'$(git branch &>/dev/null;\
#if [ $? -eq 0 ]; then \
  #echo "$(echo `git status` | grep "nothing to commit" > /dev/null 2>&1; \
  #HEADREV=`git log --pretty=%h -n 1`;
  #echo "|'$BWhite'$HEADREV" | tr -d "\n"; \
  #if [ "$?" -eq "0" ]; then \
    ## @4 - Clean repository - nothing to commit
    #echo "|'$BGreen'"$(__git_ps1 "(%s)"); \
  #else \
    ## @5 - Changes to working tree
    #echo "|'$BIRed'"$(__git_ps1 "{%s}"); \
  #fi)'$Color_Off'|'$BWhite$PathShort$Color_Off'"; \
#else \
  ## @2 - Prompt when not in GIT repo
  #echo "|'$BWhite$PathShort$Color_Off'"; \
#fi)'

#export PS1="[$MyPS1 \$] "

#######################################################################
# git prompt #3
#######################################################################

## Print nickname for git/hg/bzr/svn version control in CWD
## Optional $1 of format string for printf, default "(%s) "
#
# http://blog.grahampoulter.com/2011/09/show-current-git-bazaar-or-mercurial.html

#function be_get_branch {
  #local dir="$PWD"
  #local vcs
  #local nick
  #while [[ "$dir" != "/" ]]; do
    #for vcs in git hg svn bzr; do
      #if [[ -d "$dir/.$vcs" ]] && hash "$vcs" &>/dev/null; then
        #case "$vcs" in
          #git) __git_ps1 "${1:-(%s) }"; return;;
          #hg) nick=$(hg branch 2>/dev/null);;
          #svn) nick=$(svn info 2>/dev/null\
                #| grep -e '^Repository Root:'\
                #| sed -e 's#.*/##');;
          #bzr)
            #local conf="${dir}/.bzr/branch/branch.conf" # normal branch
            #[[ -f "$conf" ]] && nick=$(grep -E '^nickname =' "$conf" | cut -d' ' -f 3)
            #conf="${dir}/.bzr/branch/location" # colo/lightweight branch
            #[[ -z "$nick" ]] && [[ -f "$conf" ]] && nick="$(basename "$(< $conf)")"
            #[[ -z "$nick" ]] && nick="$(basename "$(readlink -f "$dir")")";;
        #esac
        #[[ -n "$nick" ]] && printf "${1:-(%s) }" "$nick"
        #return 0
      #fi
    #done
    #dir="$(dirname "$dir")"
  #done
#}

### Add branch to PS1 (based on $PS1 or $1), formatted as $2
#export GIT_PS1_SHOWDIRTYSTATE=yes
#export PS1="\$(be_get_branch "$2")${PS1}";
