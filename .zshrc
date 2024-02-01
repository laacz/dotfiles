# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZSHRC_DEBUG=0
PROMPT_EOL_MARK=""

debuglog()
{
    if [[ $ZSHRC_DEBUG -eq 1 ]]; then
        echo $1
    fi
}

export ZSH="$HOME/.oh-my-zsh"

debuglog "Setting up ZSH"

#ZSH_THEME="agnoster"
ZSH_THEME="powerlevel10k/powerlevel10k"

zstyle ':omz:update' mode auto      # update automatically without asking

plugins=(git)

HISTSIZE=100000
SAVEHIST=100000

debuglog "autoload zmv"
autoload zmv
debuglog "compinit"
autoload -Uz compinit; compinit

debuglog "source omz"
source $ZSH/oh-my-zsh.sh

# This is Laravel related stuff
alias artisan="php ./artisan"
alias phpunit="./vendor/bin/phpunit"
alias sail="./vendor/bin/sail"

# Tailing structured logs in style: tail -f log | colorlog
alias colorlog="bat -l json --paging=never"

debuglog "jetbrains on WSL2"
if [ -d ~/.local/goland/ ]; then
    alias goland="~/.local/goland/bin/goland.sh >/dev/null 2>&1 &"
fi
if [ -d ~/.local/phpstorm/ ]; then
    alias phpstorm="~/.local/phpstorm/bin/phpstorm.sh $1 >/dev/null 2>&1 &"
fi

debuglog "alias batcat/cat"
# cat replacement - bat/batcat (https://github.com/sharkdp/bat)
if type batcat >/dev/null 2>&1 
then
    debuglog "    appears to have batcat"
    alias bat="batcat -p"
    alias cat="bat"
elif type bat >/dev/null 2>&1
then
    debuglog "    appears to have bat"
    alias bat="bat -p"
    alias cat="bat"
fi

debuglog "ssh-agent"
# ssh-agent stuff
if command ssh-agent >/dev/null 2>&1
then
    eval `ssh-agent` >/dev/null 2>&1
fi

debuglog "alias exa"
# ls replacement - exa and aliases (https://github.com/ogham/exa)
if command exa >/dev/null 2>&1
then
    alias ls='exa -albF --git'
    alias ll='exa -lbF --git'
    alias l='exa -albF --git'
    alias la='exa -a --git'
fi

debuglog "prompt and path"
# :)
PROMPT="$PROMPT"

PATH="$PATH:$HOME/.cargo/bin/"
PATH="$PATH:$HOME/.local/bin"
PATH="$PATH:$HOME/.config/composer/vendor/bin"
PATH="$PATH:/usr/local/go/bin:$HOME/go/bin"
PATH="$PATH:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin" 
export PATH

debuglog "source p10k"
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

debuglog "wsl2 vpn issue workaround"
# WSL2 and a specific VPN client issue
if uname -r | grep -i -q 'microsoft' ; then sudo ip link set dev eth0 mtu 1420 ; fi

export HOMEBREW_NO_ANALYTICS=1

