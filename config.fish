function start_mongo
  brew services start mongodb-community@5.0
end

function stop_mongo
  brew services stop mongodb-community@5.0
end

function streaming_mongodb_log
  tail -f /opt/homebrew/var/log/mongodb/*.log
end

function start_mysql
  brew services start mysql
end

function stop_mysql
  brew services stop mysql
end

function code
	open -a "Visual Studio Code.app" $argv
end

function source_fish
    source ~/.config/fish/config.fish
end

function ide_2
  tmux split-window -v -p 30
  tmux split-window -h 
end

function ide_1
  tmux split-window -v -p 30
end

function ide
  tmux split-window -v -p 30
  tmux split-window -h -p 66
  tmux split-window -h -p 50
end

set fish_greeting ""

set -gx TERM xterm-256color

# theme
# set -g theme_color_scheme terminal-dark
set -g theme_color_scheme nord
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# aliases
alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l"
alias lla "ll -A"
alias g git
command -qv nvim && alias vim nvim

set -gx EDITOR nvim

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

# NodeJS
set -gx PATH node_modules/.bin $PATH

# Go
set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH

# NVM
function __check_rvm --on-variable PWD --description 'Do nvm stuff'
  status --is-command-substitution; and return

  if test -f .nvmrc; and test -r .nvmrc;
    nvm use
  else
  end
end

switch (uname)
  case Darwin
    source (dirname (status --current-filename))/config-osx.fish
  case Linux
    source (dirname (status --current-filename))/config-linux.fish
  case '*'
    source (dirname (status --current-filename))/config-windows.fish
end

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
  source $LOCAL_CONFIG
end

starship init fish | source
