init_vault ()
{
  if [[ ! $# -eq 0 ]]; then
    echo "Warning: command 'init' doesn't require any arguments."
  fi
  
  vault=`get_vault`

  if [[ -d $vault ]]; then
    echo "Warning: directory $vault already exists."
    read -p "Do you want to override it? [y/N]: "

    if [[ $REPLY == "y" ]] || [[ $REPLY == "Y" ]]; then
      rm -rf $vault
    else
      echo "Aborting the operation."
      exit 1
    fi
  fi

  mkdir -p $vault/daily

  echo "Vault initialized successfully."
  return 0
}
