# profile shell (combined with last line)
#zmodload zsh/zprof

#auto update oh-my-zsh - https://stackoverflow.com/questions/11378607/oh-my-zsh-disable-would-you-like-to-check-for-updates-prompt
DISABLE_UPDATE_PROMPT=true

# https://stackoverflow.com/a/38865693
DISABLE_UNTRACKED_FILES_DIRTY="true"



# Define oh-my-zsh
export ZSH=$HOME/.oh-my-zsh

# Set ZSH theme
ZSH_THEME="robbyrussell"

# Activate ZSH plugins
plugins=(git macos)

# use UTF8
set -g utf8

setopt auto_cd
cdpath=($HOME/git)
PS1="%{$fg[red]%}[%T] %{$fg[cyan]%}%/ ~ %{$reset_color%}"

# Grow the size of the history file
export HISTFILESIZE=2000

# Grow the size of the per tab or window history buffer in memory
export HISTSIZE=5000

# Ignore all the dupes!
export HISTCONTROL=ignoredups

# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# n prefixes
export N_PREFIX="$HOME/.n"

# Path Definitions
export GOPATH=$HOME/go
export GOROOT="/Users/bstrecansky/.asdf/installs/golang/1.19.5/go"
export GOPRIVATE="github.intuit.com"
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.rvm/bin:$HOME/.composer/vendor/bin:/usr/local/opt/coreutils/libexec/gnubin:$HOME/.pyenv/bin:/:/$HOME/go/bin:$N_PREFIX/bin:/usr/local/opt/php@7.4/bin:/usr/local/opt/php@7.4/sbin:/Volumes/CaseSensitive/mc-codesniffer-ruleset/vendor/bin:"

# Source pyenv and pyvenv
# eval "$(pyenv init -)" ; eval "$(pyenv virtualenv-init -)"

# Source asdf
. /usr/local/opt/asdf/libexec/asdf.sh

#Source the shell file for zsh
DISABLE_MAGIC_FUNCTIONS=true
source $HOME/.oh-my-zsh/oh-my-zsh.sh

# Application Shortcuts
alias k="kubectl"
alias k0='kubectl config use-context cluster0.stage'
alias katl='kubectl config use-context cluster1.prod'
alias ksuw='kubectl config use-context cluster2.prod'
alias ksea='kubectl config use-context cluster3.prod'
alias kloc='kubectl config use-context local'
alias kdt='kubectl config use-context desktop'
alias captail='stern capstone --exclude server_info --exclude "/status" --exclude GetCertStatus --timestamps --container "(anvil|demo|terminator|validator|worker)"'
alias gs="git status"
alias ga="git add -A"
alias gc="git commit -m $1"
alias gp="git push"
alias jpp='python -mjson.tool'
alias allext="find . -type f | perl -ne 'print $1 if m/\.([^.\/]+)$/' | sort -u"
alias hm="open ~"
alias ssl="echo | openssl s_client -connect $1:443 2>/dev/null | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > tmp.pem && openssl x509 -subject -dates -fingerprint -in tmp.pem | grep SHA1 | sed 's/://g'"
alias zcat='gzcat'
alias rs='redis-server /usr/local/etc/redis.conf'
alias eh="sudo vi /private/etc/hosts"
alias whatismyip="curl ipecho.net/plain; echo"
alias countdiff="diff -U 0 $1 $2 | grep -v ^@ | wc -l"
alias urldomain='echo $1 | sed -E "s/https?:\/\/([^\/?]+).*/\1/" | xargs dig'
alias ipcurl='curl ipinfo.io'
alias commatospace='cat $1 | sed "s/, /\n/g"'
alias zssh='grep ssh ~/.zshrc'
alias startmysql="sudo /usr/local/mysql/support-files/mysql.server start"
alias stopmysql=" sudo /usr/local/mysql/support-files/mysql.server stop"
alias weather="curl -4 wttr.in/atlanta"
alias twitter="t stream timeline"
# Reverse Text in Clipboard
alias reverse='pbpaste | rev | pbcopy && pbpaste'
alias checklocal="sudo arp-scan --interface=en0 --localnet"
alias tunnel="ssh -L 3306:127.0.0.1:3306 $1"
alias linode="/usr/bin/ssh -Y -F /dev/null -i ~/.ssh/linode bob@104.200.18.74"

function ap() {
   RED='\033[0;31m'
   GREEN='\033[0;32m'

   if [ -z "$https_proxy" ]; then
      export CURL_CA_BUNDLE=~/authproxy_ca.pem
      export https_proxy=http://127.0.0.1:38080
      authproxy_darwin
      printf "${GREEN}AuthProxy enabled${NC}\n"
   else
      unset CURL_CA_BUNDLE;
      unset https_proxy;
      printf "${RED}AuthProxy disabled${NC}\n"
   fi;
}


# Define Akamai Pragma Header
PRAGMA="Pragma: akamai-x-cache-on, akamai-x-cache-remote-on, akamai-x-check-cacheable, akamai-x-get-cache-key, akamai-x-get-extracted-values, akamai-x-get-nonces, akamai-x-get-ssl-client-session-id, akamai-x-get-true-cache-key, akamai-x-serial-no akamai-x-get-request-id akamai-x-tapioca-trace"

export MC_CS_RULESET=/Volumes/CaseSensitive/mc-codesniffer-ruleset/MCStandard
alias mcphpcs="phpcs --standard=$MC_CS_RULESET"

### Other Special Variables for cURL:
#url_effective
#http_code
#http_connect
#time_total
#time_namelookup
#time_connect
#time_pretransfer
#time_redirect
#time_starttransfer
#size_download
#size_upload
#size_header
#size_request
#speed_download
#speed_upload
#content_type
#num_connects
#num_redirects
#ftp_entry_path

# profile zsh (combined with first line)
#zprof

