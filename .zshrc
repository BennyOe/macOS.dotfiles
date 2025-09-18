###############################################
# Powerlevel10k instant prompt (must be first) #
###############################################
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

###############################################
# Zsh-Defer bootstrap                         #
###############################################
if [[ -r "$HOME/.zsh-plugins/zsh-defer.zsh" ]]; then
  source "$HOME/.zsh-plugins/zsh-defer.zsh"
else
  zsh-defer() { "$@"; }  # fallback if zsh-defer not installed
fi

###############
### Exports ###
###############
export ZSH="$HOME/.oh-my-zsh"
export EDITOR="nvim"

# ZEAL / test systems
export ts="app-benni-pay.test.t24.eu-west-1.sg-cloud.co.uk"
export TESTSYSTEM="app-benni-pay.test.t24.eu-west-1.sg-cloud.co.uk"
export ADYEN_HOST_PORT="payment-simulator.pay.svc.cluster.local:5433"

# Project-specific bins
export PATH="$PATH:$HOME/.alinghi/bin"
export PATH="$PATH:$HOME/.microservices/platform/bin"
export PATH="$PATH:$HOME/scripts"

###############################################
# Homebrew prefix (compute only once)         #
###############################################
HOMEBREW_PREFIX="$(/opt/homebrew/bin/brew --prefix 2>/dev/null || brew --prefix 2>/dev/null)"
if [[ -n "$HOMEBREW_PREFIX" ]]; then
  export PATH="$HOMEBREW_PREFIX/bin:$PATH"
  export PATH="$HOMEBREW_PREFIX/opt/coreutils/libexec/gnubin:$PATH"
  export PATH="$HOMEBREW_PREFIX/opt/findutils/libexec/gnubin:$PATH"
  export PATH="$HOMEBREW_PREFIX/opt/gnu-tar/libexec/gnubin:$PATH"
  export PATH="$HOMEBREW_PREFIX/opt/gnu-sed/libexec/gnubin:$PATH"
  export PATH="$HOMEBREW_PREFIX/opt/gnu-indent/libexec/gnubin:$PATH"
  export PATH="$HOMEBREW_PREFIX/opt/gnu-getopt/bin:$PATH"
fi

###############################################
# Completions                                 #
###############################################
typeset -g ZSH_COMPDUMP="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/compdump-$ZSH_VERSION-${HOST%%.*}"
setopt NO_HASH_LIST_ALL
autoload -Uz compinit

# (Optional tiny speed gain) Completion cache:
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/cached-completions"
zstyle ':completion:*' completer _complete

#############
### Theme ###
#############
ZSH_THEME="powerlevel10k/powerlevel10k"

###############
### Plugins ###
###############
plugins=(
  git
  colored-man-pages
  zsh-autosuggestions
  vi-mode
  colorize
)

source "$ZSH/oh-my-zsh.sh"

[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

################
# Fuzzy find   #
################
_fzf_lazy_load() { unfunction _fzf_lazy_load; source <(fzf --zsh) }
bindkey -s '^T' '_fzf_lazy_load\n'
bindkey -s '^R' '_fzf_lazy_load\n'
bindkey -s '^[c' '_fzf_lazy_load\n'
fzf() { _fzf_lazy_load; command fzf "$@"; }

###############################################
# Lazy loaders for heavy toolchains           #
###############################################
# --- NVM / Node ---
export NVM_DIR="$HOME/.nvm"
_nvm_lazy_load() {
  unset -f nvm node npm npx corepack
  [[ -s "/opt/homebrew/opt/nvm/nvm.sh" ]] && . "/opt/homebrew/opt/nvm/nvm.sh"
  [[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ]] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
}
for _cmd in nvm node npm npx corepack; do
  eval "$_cmd() { _nvm_lazy_load; $_cmd \"\$@\"; }"
done; unset _cmd

# --- jenv ---
_jenv_lazy() { unset -f jenv; command -v jenv >/dev/null && eval "$(jenv init -)"; }
jenv() { _jenv_lazy; command jenv "$@"; }

# --- pyenv ---
_pyenv_lazy() {
  unset -f pyenv python pip
  export PYENV_ROOT="$HOME/.pyenv"
  [[ -d "$PYENV_ROOT" ]] && export PATH="$PYENV_ROOT/bin:$PATH"
  command -v pyenv >/dev/null && eval "$(pyenv init -)"
}
pyenv()  { _pyenv_lazy; command pyenv "$@"; }
python() { _pyenv_lazy; command python "$@"; }
pip()    { _pyenv_lazy; command pip "$@"; }

# --- SDKMAN ---
export SDKMAN_DIR="$HOME/.sdkman"
sdk() { [[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"; command sdk "$@"; }

#################################
# Lazy docker/docker-compose     #
#################################
dockcomp() {
  if ! typeset -p _comps >/dev/null 2>&1; then
    autoload -Uz compinit
    compinit -C -d "$ZSH_COMPDUMP"
  fi
  unfunction dockcomp
}
alias docker='dockcomp && docker'
alias docker-compose='dockcomp && docker-compose'

###############################################
# Syntax highlighting                         #
###############################################
zsh-defer source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

###############################################
# Command correction                          #
###############################################
setopt CORRECT

###############
### Aliases ###
###############
alias vim='nvim'; alias v='vim'; alias oldvim='\vim'
alias lsl='lsd -a'; alias ls='lsd'; alias lsla='lsd -la'
alias vimrc='vim ~/.config/nvim/init.lua'
alias bashrc='vim ~/.bashrc'
alias zshrc='vim ~/.zshrc'
alias wezrc='vim ~/.wezterm.lua'
alias gac='git add -A && git commit -a'
alias gst='git status'; alias gpu='git push'; alias gall='git add .'
alias gpl='git pull'; alias gck='git checkout'; alias lg='lazygit'
alias size='sudo du -shc '
alias dr='docker run'; alias ds='docker start'; alias de='docker exec'; alias dk='docker stop'
alias dps='docker ps'; alias dcud='docker-compose up -d'; alias dcu='docker-compose up'
alias dcd='docker-compose down'; alias dce='docker-compose exec'
alias riverpod='fvm dart run build_runner watch'
alias vpnConnect="$HOME/scripts/vpn_connect.sh"

#############################
# yazi + return-to-cwd helper
#############################
ra() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXX")"
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

###############################################
# Visual tweaks                               #
###############################################
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=242'

###############################################
# On-demand completions (faster startup)      #
###############################################
dartcomp() { local f="$HOME/.dart-cli-completion/zsh-config.zsh"; [[ -f "$f" ]] && source "$f"; }
alias dart='dartcomp && dart'
ngcomp() { source <(ng completion script); }
alias ng='ngcomp && ng'

