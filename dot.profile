SUBLIME_BIN="/Applications/Sublime Text.app/Contents/SharedSupport/bin"
export PATH=$PATH:$SUBLIME_BIN

git_modified_files() {
  change=$(git status --porcelain 2> /dev/null)
  if [[ "$change" == "" ]]; then
    echo "39"
  else
    echo "33"
  fi
}

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

update_prompt_colour() {
  export PS1="\[\e[32m\]\w\[\e[$(git_modified_files)m\]\$(parse_git_branch)\[\e[39m\] $ "
}

PROMPT_COMMAND="update_prompt_colour"

# docker aliases
alias dc="docker container"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
