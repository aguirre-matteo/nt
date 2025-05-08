find_file ()
{
  if [[ ! $# -eq 1 ]]; then
    echo "Error: expected 1 argument."
    exit 1
  fi 

  vault=`get_vault`
  find $vault | sed "s|$vault||g" | grep -i $1
}
