assert_vault()
{
  vault_path_unset_error
  get_vault > /dev/null

  if [[ ! $? -eq 0 ]]; then
    get_vault
    exit 1
  fi 

  vault=`get_vault`
  if [[ ! -d $vault ]]; then
    echo "Error: vault $vault doesn't exists. Run 'nt init' first."
    exit 1
  fi
}
