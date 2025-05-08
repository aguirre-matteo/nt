browse_vault ()
{
  if command -v fzf >/dev/null 2>&1; then
    echo > /dev/null
  else 
    echo "Error: command 'fzf' not found."
    exit 1
  fi 

  vault=`get_vault`

  if [[ ! -d $vault ]]; then
    echo "Error: vault $vault doesn't exists. Run 'nt init' first."
    exit 1
  fi
  
  workingDir=`pwd`
  cd $vault
  file=`__select`
  editor=`get_editor`

  if [ -n "$file" ] ; then
    "$editor" "$file"
    browse_vault ""
  fi

  cd $workingDir
}

__select()
{
  fzf --preview="cat {}" --preview-window=right:70%:wrap
}
