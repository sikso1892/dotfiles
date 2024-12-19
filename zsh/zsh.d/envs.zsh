# Environment Variables and Shell Options for ZSH
# (overrides prezto's default settings or zshenv)


# fzf {{{
#https://github.com/junegunn/fzf/wiki/Configuring-shell-key-bindings

# fzf-powered CTRL-R: launch fzf with sort enabled
# @see https://github.com/junegunn/fzf/issues/526
export FZF_CTRL_R_OPTS="--sort --prompt 'History> '"

# Ctrl-T: Setting ripgrep or fd as the default source for Ctrl-T fzf
if (( $+commands[rg] )); then
    export FZF_CTRL_T_COMMAND='rg --files --hidden --follow --no-messages --glob "!.git/"'
elif (( $+commands[fd] )); then
    export FZF_CTRL_T_COMMAND='fd --type f'
fi
if (( $+commands[bat] )); then
    # if bat is available, use it as a preview tool
    export FZF_CTRL_T_OPTS="--preview 'bat {} --color=always --line-range :30'"
fi

# ALT-C: FASD_CD with preview
export FZF_ALT_C_COMMAND='fasd_cd -d -l -R'
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200' --prompt 'cd> '"

# Color and appearances for fzf
# background color: use brighter and more visible color.
# marker: use yellow-ish color to make it more appearant
export FZF_DEFAULT_OPTS="--color 'bg+:239,marker:226'"

# }}}

# fzf-git
if (( $+commands[delta] )); then
  export FZF_GIT_PAGER='delta --commit-decoration-style="none"'
else
  export FZF_GIT_PAGER='less'
fi

# Save more history entries
# @see history/init.zsh
export HISTSIZE=10000000
export SAVEHIST=10000000

# Save timestamp and the duration as well into the history file.
setopt EXTENDED_HISTORY

# new history lines are added incrementally as soon as they are entered,
# rather than waiting until the shell exits
setopt INC_APPEND_HISTORY

# No, I don't wan't share command history.
unsetopt SHARE_HISTORY
setopt NO_SHARE_HISTORY

# See zsh-autoswitch-virtualenv #19
unsetopt AUTO_NAME_DIRS       # Do not auto add variable-stored paths

# If globs do not match a file, just run the command rather than throwing a no-matches error.
# This is especially useful for some commands with '^', '~', '#', e.g. 'git show HEAD^1'
unsetopt NOMATCH

# Editor
if (( $+commands[nvim] )) && [[ -z "$GIT_EDITOR" ]] ; then
  export GIT_EDITOR="nvim"
fi

# AWS Tools - Target Regions Configuration
# This variable defines the AWS regions to be searched when using aws-tools
# You can modify this list based on your infrastructure requirements
export AWS_REGIONS=(
    "ap-northeast-1"  # Tokyo, Japan (Asia Pacific)
    "ap-northeast-2"  # Seoul, South Korea (Asia Pacific)
    "ap-northeast-3"  # Osaka, Japan (Asia Pacific)
    "ap-southeast-1"  # Singapore (Asia Pacific)
    "us-east-1"      # N. Virginia (US East)
    "us-east-2"      # Ohio (US East)
    "us-west-2"      # Oregon (US West)
    "eu-west-3"      # Paris (Europe)
    "me-central-1"   # UAE (Middle East)
)

# Path Configurations: Removed, DON'T PUT HERE.
#
# Note: Configuring $PATH should be done preferably in:
#   ~/.zshenv    (available even for non-login shells and scripts as well as interactive shells)
#   ~/.zshrc     (available only for interactive (login or non-login) shells)
#
