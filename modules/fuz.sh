open_fuz ()
{
  if command -v fzf >/dev/null 2>&1; then
    echo > /dev/null
  else 
    echo "Error: command 'fzf' not found."
    exit 1
  fi 

  vault=`get_vault`
  assert_vault
  
  workingDir=`pwd`
  cd $vault
  file=`__select`
  editor=`get_editor`

  if [ -n "$file" ] ; then
    "$editor" "$file"
    open_fuz ""
  fi

  cd $workingDir
}

__select()
{
  fzf --preview="cat {}" --preview-window=right:70%:wrap
}
