function _git_branch_name
  echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
  echo (command git status -s --ignore-submodules=dirty ^/dev/null)
end

function fish_prompt -d "Write out the prompt"
  set -l cyan (set_color cyan)
  set -l yellow (set_color yellow)
  set -l green (set_color green)
  set -l red (set_color red)
  set -l blue (set_color blue)
  set -l blue_gray (set_color 68A)
  set -l purple (set_color A9F)
  set -l light_purple (set_color C9F)
  set -l dark_purple (set_color 62A)
  set -l orange (set_color D52)
  set -l normal (set_color normal)
  set -l whoami (whoami)

  set -l hostname (hostname|cut -d . -f 1)
#  set -l arrow "$red  "
  set -l arrow "$red ><> "

 if [ (_git_branch_name) ]
    set -l git_branch $red(_git_branch_name)
    set git_info "$blue git:($git_branch$blue)"

    if [ (_is_git_dirty) ]
      set -l dirty "$yellow ✗"
      set git_dirty "$dirty"
    end
  end
  
#  printf '%s@%s%s> ' (whoami) (hostname|cut -d . -f 1) (set_color normal)
  echo -n -s  $orange $whoami @ $hostname $git_info $arrow $normal
end
