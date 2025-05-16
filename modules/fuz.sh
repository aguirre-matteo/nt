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

  if [[ $file == "terminate" ]]; then
    cd $workingDir
    return 0
  else
    open_note $file
    open_fuz
  fi
}

__select()
{
  output=`fzf --preview="cat {}" --preview-window=right:70%:wrap --print-query | grep -v '^[[:space:]]*$' | tail -n 1`
  lines=`echo $output | wc -l`

  if [[ $lines -gt 1 ]]; then
    echo "Error: fzf returned more that 2 lines."
    exit 1
  elif [[ $lines -eq 1 ]] && [[ $output != "" ]]; then
    file=${output%.md}
  else 
    file=terminate
  fi

  echo $file
}
