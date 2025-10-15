if [[ $- == *i* ]] && [[ -z "$NVIM" ]]; then
  cd ~
fi
# -----------------------------------
# Oh My Zsh Base
# -----------------------------------
export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/.local/share/nvim/mason/bin:$PATH"

ZSH_THEME="agnoster"  # We use Oh My Posh instead
plugins=(
  git
  z
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
# -----------------------------------
# Oh My Posh
# -----------------------------------
# eval "$(oh-my-posh init zsh --config ~/.poshthemes/takuya.omp.json)"
# eval "$(oh-my-posh init zsh --config ~/.poshthemes/sim-web.omp.json)"
# eval "$(oh-my-posh init zsh --config ~/.poshthemes/clean-detailed.omp.json)"
# eval "$(oh-my-posh init zsh --config ~/.poshthemes/slim.omp.json)"
# eval "$(oh-my-posh init zsh --config ~/.poshthemes/uew.omp.json)"
# eval "$(oh-my-posh init zsh --config ~/.poshthemes/tokyonight.omp.json)"
# eval "$(oh-my-posh init zsh --config ~/.poshthemes/json.omp.json)"
# eval "$(oh-my-posh init zsh --config ~/.poshthemes/emodipt-extend.omp.json)"
:

# Useful Aliases
# -----------------------------------
# -----------------------------------
alias ll="exa -lah --icons"
alias grep="grep --color=auto"
alias cls="clear"
alias vim="nvim"
alias code="code ."
alias dev="npm run dev"
alias build="npm run build"
alias install="npm install"
alias serve="npx serve"
alias kill3000="kill -9 $(lsof -t -i:3000)"
alias ports="lsof -i -P -n | grep LISTEN"
alias projects="cd projects"
# -----------------------------------
# Start tmux Automatically
# -----------------------------------
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
  tmux has-session -t 1 2>/dev/null

  if [ $? != 0 ]; then
    tmux new-session -s main
  else
    tmux attach-session -t main
  fi
fi
# Modify shell 
alias zreload='source ~/.zshrc && echo "Zsh reloaded!"'
alias zconfig='vim ~/.zshrc'
alias zthemes='vim ~/.poshthemes'
# Modify tmux
alias tconfig='vim ~/.tmux.conf'
alias treload='tmux source-file ~/.tmux.conf && echo "tmux config reloaded!"'
# new tmux session
tmuxnew() {
    if [ -z "$1" ]; then
        echo "Usage: tmuxnew <session-name>"
        return 1
    fi
    tmux new-session -s "$1"
}
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# -----------------------------------
# zoxide for fast directory jumping
# -----------------------------------
eval "$(zoxide init zsh)"
# -----------------------------------
# FZF for fuzzy search
# -----------------------------------
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# -----------------------------------
# History
# -----------------------------------
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
export PATH="$HOME/.local/bin:$PATH"
