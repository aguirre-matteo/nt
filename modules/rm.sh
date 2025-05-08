rm_file ()
{
  if [[ ! $# -eq 1 ]]; then
    echo "Error: expected 1 argument."
    exit 1
  fi 

  vault=`get_vault`
  path=$vault/$1
  path=`realpath -m $path`

  if [[ -d $path ]]; then
    echo "Warning: $path is a directory."
    read -p "Are you sure you want to delete it? [y/N]: "

    if [[ $REPLY != "y" ]] || [[ $REPLY != "Y" ]]; then
      echo "Aborting the operation."
      exit 1
    fi

    rm -rf $path
    return 0
  fi

  if [[ ! -f $path ]]; then
    echo "nt: cannot remove '$path': No such file or directory"
    exit 1
  fi 

  rm $path
}
