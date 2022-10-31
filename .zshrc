# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

#ZSH_THEME="agnoster"
ZSH_THEME="powerlevel10k/powerlevel10k"

zstyle ':omz:update' mode auto      # update automatically without asking

plugins=(git)

HISTSIZE=100000
SAVEHIST=100000

source $ZSH/oh-my-zsh.sh

autoload zmv
autoload -Uz compinit; compinit

alias artisan="php ./artisan"
alias phpunit="./vendor/bin/phpunit"
alias sail="./vendor/bin/sail"

# :)
PROMPT="$PROMPT"

PATH="$PATH:$HOME/.cargo/bin/"
PATH="$PATH:$HOME/.local/bin"
PATH="$PATH:/usr/local/go/bin:$HOME/go/bin"
PATH="$PATH:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin" 
export PATH

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# WSL2 and a specific VPN client issue
if uname -r | grep -i -q 'microsoft' ; then sudo ip link set dev eth0 mtu 1420 ; fi
