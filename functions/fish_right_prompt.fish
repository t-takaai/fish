function prompt_pwd_long --description 'Print the current working directory, NOT shortened to fit the prompt'
    if test "$PWD" != "$HOME"
        printf "%s" (echo $PWD|sed -e 's|/private||' -e "s|^$HOME|~|")
    else
        echo '~'
    end

end

function fish_right_prompt -d "Write out the right prompt"
  set -l green (set_color green)
#  set -l pwd (prompt_pwd)
  set -l pwd (prompt_pwd_long)
  set -l time (date "+$c2%H$c0:$c2%M$c0:$c2%S")
#  printf '%s' $pwd
  echo -n -s $green $pwd '  ' [$time] ' '
end





