export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh
alias open=xdg-open
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH=$PATH:/home/$USER/.local/bin

alias perso=/home/$USER/Documents/Perso
alias code=codium
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/home/$USER/go/bin
export PATH=$PATH:/home/linuxbrew/.linuxbrew/bin
export PATH=$PATH:/home/$USER/.cargo/bin

if [ -d "$HOME/platform-tools" ] ; then
    PATH="$HOME/platform-tools:$PATH"
fi
