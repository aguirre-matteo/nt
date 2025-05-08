open_daily ()
{
  if [[ ! $# -eq 0 ]]; then
    echo "Warning: command 'nt daily' doesn't requires any arguments."
  fi 

  today=`date --iso-8601`
  open_note daily/$today
}
