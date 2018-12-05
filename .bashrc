export HISTSIZE=100000
shopt -s histappend
reset=$(tty -s && tput sgr0)

egdbtool () { emacs -nw --eval "(gdb \"gdb -i=mi -x debug.gdb\")";}
export PERL5LIB="$PERL5LIB:/net/lib/perl5"
alias lt='ls -lhtr'
alias lsr='ls -lShr'
alias ls='ls -G'
alias dum='du --max-depth=1 -h'
alias dfh='df -h'
alias timef='/usr/bin/time -f "user: %U avg_mem: %K avg_data:%D max_res_mem: %M"'
alias duh='du --max-depth=1 -h'
alias findpy='find -name "*.py" | xargs grep -n'
alias rth-login='ssh pkerp@genome.ku.dk'
alias tgdb='gdb --tui -x debug.gdb'
alias fivestats="awk '{if(min=="'""'"){min=max=\$1}; if(\$1>max) {max=\$1}; if(\$1<min) {min=\$1}; total+=\$1; count+=1} END {print min, total/count, max, count}'"
alias sz='stat -c "%n %s"'
alias tattach='tmux attach -t'
alias sattach='screen -r'
alias tnew='tmux new -s'
alias tls='tmux ls'
alias lst="ls -R | grep ':$' | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"
alias aws-login='ssh -i ~/devenv-key.pem ubuntu@52.39.128.151'
alias zcat='gzcat'
alias vi='vim'
alias sac='source activate cenv3'


export PATH="$PATH:/Users/pkerpedjiev/apps/apache-maven-3.6.0/bin"
export JAVA_HOME=$(/usr/libexec/java_home -v 1.5)

export WORKON_HOME=$HOME/.virtualenvs
export PATH="$HOME/.node/bin:$PATH"
export PATH="$PATH:~/local/bin"
# added by Miniconda3 4.3.21 installer
export PATH="/Users/peter/miniconda3/bin:$PATH"
#source /usr/local/bin/virtualenvwrapper.sh

stty stop ^X
#rem
export SPARK_CONF_DIR=~/.spark-conf

# added by travis gem
[ -f /Users/peter/.travis/travis.sh ] && source /Users/peter/.travis/travis.sh

# Adds the current branch to the bash prompt when the working directory is
# part of a Git repository. Includes color-coding and indicators to quickly
# indicate the status of working directory.
#
# To use: Copy into ~/.bashrc and tweak if desired.
#
# Based upon the following gists:
# <https://gist.github.com/henrik/31631>
# <https://gist.github.com/srguiwiz/de87bf6355717f0eede5>
# Modified by me, using ideas from comments on those gists.
#
# License: MIT, unless the authors of those two gists object :)

git_branch() {
    # -- Finds and outputs the current branch name by parsing the list of
    #    all branches
    # -- Current branch is identified by an asterisk at the beginning
    # -- If not in a Git repository, error message goes to /dev/null and
    #    no output is produced
    git branch --no-color 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

git_status() {
    # Outputs a series of indicators based on the status of the
    # working directory:
    # + changes are staged and ready to commit
    # ! unstaged changes are present
    # ? untracked files are present
    # S changes have been stashed
    # P local commits need to be pushed to the remote
    local status="$(git status --porcelain 2>/dev/null)"
    local output=''
    [[ -n $(egrep '^[A]' <<<"$status") ]] && output="${output}A"
    [[ -n $(egrep '^[MADRC]' <<<"$status") ]] && output="$output+"
    [[ -n $(egrep '^.[MD]' <<<"$status") ]] && output="$output!"
    [[ -n $(egrep '^\?\?' <<<"$status") ]] && output="$output?"
    [[ -n $(git stash list) ]] && output="${output}S"
    [[ -n $(git log --branches --not --remotes) ]] && output="${output}P"
    [[ -n $output ]] && output="|$output"  # separate from branch name
    echo $output
}

git_color() {
    # Receives output of git_status as argument; produces appropriate color
    # code based on status of working directory:
    # - White if everything is clean
    # - Green if all changes are staged
    # - Red if there are uncommitted changes with nothing staged
    # - Yellow if there are both staged and unstaged changes
    # - Blue if there are unpushed commits
    local staged=$([[ $1 =~ \+ ]] && echo yes)
    local untracked=$([[ $1 =~ [\?] ]] && echo yes)
    local dirty=$([[ $1 =~ [!A] ]] && echo yes)
    local needs_push=$([[ $1 =~ P ]] && echo yes)
    if [[ -n $staged ]] && [[ -n $dirty ]]; then
        echo -e '\033[0;35m'  # bold magenta
    elif [[ -n $dirty ]]; then
        echo -e '\033[0;31m'  # bold red
    elif [[ -n $untracked ]]; then
        echo -e '\033[0;33m'  # bold yellow
    elif [[ -n $needs_push ]]; then
        echo -e '\033[0;32m'  # bold green
    else
        echo -e '\033[0;34m' # bold blue
    fi
}

git_prompt() {
    # First, get the branch name...
    local branch=$(git_branch)
    # Empty output? Then we're not in a Git repository, so bypass the rest
    # of the function, producing no output
    if [[ -n $branch ]]; then
        local state=$(git_status)
        local color=$(git_color $state)
        # Now output the actual code to insert the branch and status
        echo -e "\x01$color\x02[$branch$state]\x01\033[00m\x02"  # last bit resets color
    fi
}

# Sample prompt declaration. Tweak as you see fit, or just stick
# "$(git_prompt)" into your favorite prompt.
PS1='\u@\h:\w $(git_prompt)\[\033[00m\]\$ '

export PATH="/home/ubuntu/miniconda3/bin:$PATH"
alias config='/usr/bin/git --git-dir=/Users/pkerpedjiev/.cfg/ --work-tree=/Users/pkerpedjiev'
