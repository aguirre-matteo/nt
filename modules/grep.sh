grep_vault ()
{
  if [[ ! $# -eq 1 ]]; then
    echo "Error: expected one argument."
    exit 1
  fi 

  vault=`get_vault`
  assert_vault
  grep -r $1 $vault
}
