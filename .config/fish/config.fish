# locale
set -gx LANG "ja.JP.UTF-8"
set -gx LC_ALL "ja_JP.UTF-8"

# nodebrew
set -x PATH $HOME/.nodebrew/current/bin $PATH

# prompt_pwd
set -g fish_prompt_pwd_dir_length 0


# aliases
## nav
function .. ; cd .. ; end
function ... ; cd ../.. ; end
function la --wraps "la" ; ls -a $argv ; end

## util
function grep ; command grep --color=auto $argv ; end

abbr --add master git checkout master
abbr --add g git
abbr --add be bundle exec


# functions
## chpwd
function chpwd --on-variable PWD
  ls
end

## peco
function fish_user_key_bindings
  bind \cr peco_select_history
  bind \co peco_select_directory
end

function peco_select_directory
  find . -type d|peco|read foo

  if [ $foo ]
    cd $foo
  else
    commandline ''
  end
end
