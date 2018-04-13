# Setup fzf
# ---------
if [[ ! "$PATH" == */home/nick/.fzf/bin* ]]; then
  export PATH="$PATH:/home/nick/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/nick/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/nick/.fzf/shell/key-bindings.zsh"

