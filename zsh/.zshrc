# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export FZF_DEFAULT_OPTS="
--color=fg:#908caa,hl:#ebbcba
--color=fg+:#e0def4,hl+:#ebbcba
--color=border:#403d52,header:#31748f,gutter:#191724
--color=spinner:#f6c177,info:#9ccfd8,separator:#403d52
--color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa"

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git zsh-syntax-highlighting zsh-autosuggestions fzf fzf-tab z)

source $ZSH/oh-my-zsh.sh

# fzf_completions_path
fzf_completions_path=~/.oh-my-zsh/completions
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# aliases
alias l='exa -lah --icons'
alias ll='exa -lh --icons'
alias mvn:qs="mvn archetype:generate -DarchetypeGroupId=org.apache.maven.archetypes -DarchetypeArtifactId=maven-archetype-quickstart -DarchetypeVersion=1.4"
alias mvnw="./mvnw"
alias gradlew="./gradlew"
alias nv='nvim'
alias gs='git status '
alias gss='git status -s'
alias gp='git pull -r'
alias gh='git push '
alias gho='git push -u origin '
alias up='git push '
alias upo='git push -u origin '
alias ga='git add '
alias gaa='git add -A'
alias gb='git branch '
alias gc='git commit '
alias gcm='git commit -m '
alias gd='git diff'
#alias go='git checkout '
alias gob='git checkout -b'
alias gk='gitk --all&'
alias gx='gitx --all'
alias got='git '
alias get='git '
alias g='git '
alias gm='git merge '
alias gr='git reset '
alias gdf='git clean -f'
alias bat=batcat
alias xcp='xclip -selection clipboard'

# tmuxifier
export PATH="$HOME/.tmuxifier/bin:$PATH"
alias tm=tmuxifier

# editor
export EDITOR="/usr/local/bin/nvim"

# fnm
export PATH="/home/mahl/.local/share/fnm:$PATH"
eval "`fnm env`"

# bun completions
[ -s "/home/mahl/.bun/_bun" ] && source "/home/mahl/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# brew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# pnpm
export PNPM_HOME="/home/mahl/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# lombok
export JDTLS_JVM_ARGS="-javaagent:$HOME/.local/share/java/lombok.jar"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"


# Load Angular CLI autocompletion.
source <(ng completion script)

# pnpm
export PNPM_HOME="/home/mahl/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
