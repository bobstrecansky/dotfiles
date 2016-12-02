# Define oh-my-zsh
export ZSH=$HOME/.oh-my-zsh
 
#Source the shell file for zsh
source $HOME/.oh-my-zsh/oh-my-zsh.sh

# Set ZSH theme
ZSH_THEME="robbyrussell"

# Activate ZSH plugins
plugins=(git bundler osx rake ruby python)

# use UTF8
set -g utf8

zstyle -s ':completion:*:hosts' hosts _ssh_config
[[ -r ~/.ssh/config ]] && _ssh_config+=($(cat ~/.ssh/config | sed -ne 's/Host[=\t ]//p'))
zstyle ':completion:*:hosts' hosts $_ssh_config

setopt auto_cd
cdpath=($HOME/git)

#powerline-daemon -q
#POWERLINE_BASH_CONTINUATION=1
#POWERLINE_BASH_SELECT=1
#source /Library/Python/2.7/site-packages/powerline/bindings/zsh/powerline.zsh

PS1="%{$fg[red]%}[%T] %{$fg[cyan]%}%/ ~ %{$reset_color%}"
#autoload -U colors && colors
#PS1="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%~ %{$reset_color%}%% "

# Grow the size of the history file
export HISTFILESIZE=2000000

# Grow the size of the per tab or window history buffer in memory
export HISTSIZE=5000

# Ignore all the dupes!
export HISTCONTROL=ignoredups

# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# Path Definitions
export GOPATH=$HOME/go
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.rvm/bin:$HOME/.composer/vendor/bin:/usr/local/opt/coreutils/libexec/gnubin:$HOME/.pyenv/bin:/:/$HOME/go/bin"

# Source pyenv and pyvenv
eval "$(pyenv init -)" ; eval "$(pyenv virtualenv-init -)"

#Source the shell file for zsh
source $HOME/.oh-my-zsh/oh-my-zsh.sh

# Application Shortcuts
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
alias free='top -l 1 | head -n 10 | grep PhysMem'
alias zssh='grep ssh ~/.zshrc'
alias startmysql="sudo /usr/local/mysql/support-files/mysql.server start"
alias stopmysql=" sudo /usr/local/mysql/support-files/mysql.server stop"
alias weather="curl -4 wttr.in/atlanta"
alias twitter="t stream timeline"
# Reverse Text in Clipboard
alias reverse='pbpaste | rev | pbcopy && pbpaste'
alias ap="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport -I en1"
alias checklocal="sudo arp-scan --interface=en0 --localnet"
alias tunnel="ssh -L 3306:127.0.0.1:3306 $1"

# Define Akamai Pragma Header
PRAGMA="Pragma: akamai-x-cache-on, akamai-x-cache-remote-on, akamai-x-check-cacheable, akamai-x-get-cache-key, akamai-x-get-extracted-values, akamai-x-get-nonces, akamai-x-get-ssl-client-session-id, akamai-x-get-true-cache-key, akamai-x-serial-no akamai-x-get-request-id akamai-x-tapioca-trace"

function sha(){
echo | openssl s_client -connect $1:443 2>/dev/null | openssl x509 -subject -dates -fingerprint -noout
}

# Dig multiple properties listed in ARG1.txt at a time
function multidig()
{
 dig -f "$1" +noall +answer;
}

# Find the primary nameserver:
function primaryns()
{
dig +short SOA "$1" | cut -d' ' -f1
}

# cURL multiple URLs - find their redirect locations from sourcefile [$1]
function multicurl()
{
xargs curl -sw '%{response_code} %{url_effective}' < $1
}

# cURL multiple URLs - echo only their response code and their location:
function inputmulticurl()
{
echo "" && xargs -n 1 curl -sL -w "%{http_code} %{url_effective}\n" < $1 -o /dev/null && echo ""
}

function pragmacurl(){
curl -s -o /dev/null -D out.txt -H $PRAGMA $1 && cat out.txt
}

function tldig(){
dig $1 @a.gtld-servers.net
}

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

function tailhost(){
 cat /private/etc/hosts | tail -$1;
}

#turn an MP4 [ARG1] into a MP3 [ARG2]
function mp4mp3(){
 ffmpeg -i "$1" -f mp3 -ab 320000 -vn "$2";
}

function genpasswd() { 
LC_CTYPE=C tr -dc A-Za-z0-9_\!\@\#\$\%\^\&\*\(\)-+= < /dev/urandom | head -c 10 | xargs
}

function gencharpasswd() {
i="0"
while [ $i -lt 100 ]
do
LC_CTYPE=C tr -dc A-Za-z0-9 < /dev/urandom | head -c 10 | 
xargs
i=$[$i+1]
done
}
 
function Httpauth() {
echo –n “$1” |base64
}

function stockcurl(){
curl -s "http://finance.google.com/finance/info?client=ig&q=NASDAQ%3aAKAM" | cat | sed 's/\///g' | jq '.[] | .l'
}

function hn(){
echo $1 | sed -E 's/\/[A-Za-z0-9\-\.\#]+\///g'
}

# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

function showHiddenFiles(){
defaults write com.apple.finder AppleShowAllFiles -bool YES && killall finder
}

function hideHiddenFiles(){
defaults write com.apple.finder AppleShowAllFiles -bool NO && killall finder
}

function sslexpire(){
echo | openssl s_client -connect $1:443 2>/dev/null | openssl x509 -noout -dates
}

function sha(){
echo | openssl s_client -connect $1:443 2>/dev/null | openssl x509 -noout -dates -fingerprint
}

#  -nd (no directories): download all files to the current directory
#  -e robots.off: ignore robots.txt files, don't download robots.txt files
#  -A png,jpg: accept only files with the extensions png or jpg
#  -m (mirror): -r --timestamping --level inf --no-remove-listing
function wgetall(){
wget -r -np -k $1
}

function tf(){
echo "(╯°□°)╯︵ ┻━┻"
}

function cdb(){
echo "(tableflip)ノ( ゜-゜ノ)"
}

function darude(){
echo "༼ つ ◕_◕ ༽つ DUDUDUDUDUDUDUDUDUDU"
}

function phpserver(){
php -S localhost:8000
}

function camera(){
sudo killall VDCAssistant
}

function nomdepotsync(){
rsync -rtvz ~/Desktop/thenomdepot -e ssh sshacs@mailchimp.upload.akamai.com:/391386
}

# Set pyenv properly
eval "$(pyenv init -)" ; eval "$(pyenv virtualenv-init -)"
