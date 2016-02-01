function _peco_change_directory_migemo
  if [ (count $argv) ]
    peco --layout=bottom-up --query "$argv " --initial-filter Migemo|perl -pe 's/([ ()])/\\\\$1/g'|read foo
  else
    peco --layout=bottom-up --initial-filter Migemo|perl -pe 's/([ ()])/\\\\$1/g'|read foo
    end
    if [ $foo ]
    builtin cd $foo
  else
    commandline ''
  end
end
function peco_change_directory_migemo
  begin
    echo $HOME/Documents
    echo $HOME/Desktop
    echo $HOME/.config
    ls -ad */|perl -pe "s#^#$PWD/#"|egrep -v "^$PWD/\."|head -n 5
    sort -r -t '|' -k 3 ~/.z|sed -e 's/\|.*//'
    ghq list -p
    ls -ad */|perl -pe "s#^#$PWD/#"|grep -v \.git
  end | sed -e 's/\/$//' | awk '!a[$0]++' | _peco_change_directory_migemo $argv
end
