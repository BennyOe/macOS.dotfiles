# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

###############
### Exports ###
###############
# Path to your Oh My Zsh installation.
export ts="app-benni-pay.test.t24.eu-west-1.sg-cloud.co.uk"
export TESTSYSTEM="app-benni-pay.test.t24.eu-west-1.sg-cloud.co.uk"
export PATH="$PATH:$HOME/.alinghi/bin"
export PATH="$PATH:$HOME/.microservices/platform/bin"
export PATH="$PATH:$HOME/scripts"
export ZSH="$HOME/.oh-my-zsh"
export EDITOR="nvim"
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export PATH="$(brew --prefix)/bin:$PATH"
export PATH="$(brew --prefix)/opt/coreutils/libexec/gnubin:$PATH"
export PATH="$(brew --prefix)/opt/findutils/libexec/gnubin:$PATH"
export PATH="$(brew --prefix)/opt/gnu-tar/libexec/gnubin:$PATH"
export PATH="$(brew --prefix)/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="$(brew --prefix)/opt/gnu-indent/libexec/gnubin:$PATH"
export PATH="$(brew --prefix)/opt/gnu-getopt/bin:$PATH"
export ADYEN_HOST_PORT="payment-simulator.pay.svc.cluster.local:5433"

# Theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Fuzzy find
source <(fzf --zsh)

# Uncomment the following line to enable command auto-correction.
 ENABLE_CORRECTION="true"

# Plugins
plugins=(git
   git
	colored-man-pages
	zsh-autosuggestions
	zsh-syntax-highlighting
	vi-mode
	colorize
    docker 
    docker-compose 
)

source $ZSH/oh-my-zsh.sh

###############
### Aliases ###
###############
# alias for neovim
alias vim='nvim'
alias v='vim'
alias oldvim='\vim'

# alias for better ls
alias lsl='lsd -a'
alias ls='lsd'
alias lsla='lsd -la'

#alias for faster *rc editing
alias vimrc='vim ~/.config/nvim/init.lua'
alias bashrc='vim ~/.bashrc'
alias zshrc='vim ~/.zshrc'
alias wezrc='vim ~/.wezterm.lua'

# git aliases
alias gac='git add -A && git commit -a'
alias gst='git status'
alias gpu='git push'
alias gall='git add .'
alias gpl='git pull'
alias gck='git checkout'
alias lg='lazygit'

#alias for foldersize
alias size='sudo du -shc '

# aliases for docker
alias dr='docker run'
alias ds='docker start'
alias de='docker exec'
alias dk='docker stop'
alias dps='docker ps'
alias dcud='docker-compose up -d'
alias dcu='docker-compose up'
alias dcd='docker-compose down'
alias dce='docker-compose exec'

# alias for flutter riverpod
alias riverpod='fvm dart run build_runner watch'

# alias for zeal dev systems
alias vpnConnect='~/scripts/vpn_connect.sh'

#yazi config
function ra() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# java version manage
eval "$(jenv init -)"

# python version manage
eval "$(pyenv init --path)"

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /Users/benjamin.oechsle/.dart-cli-completion/zsh-config.zsh ]] && . /Users/benjamin.oechsle/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]



# Load Angular CLI autocompletion.
source <(ng completion script)
