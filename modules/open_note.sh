open_note ()
{
  if [[ ! $# -eq 1 ]]; then
    echo "Error: Expected only one argument."
    exit 1
  fi
  
  arg=$1
  vault=`get_vault`
  destiny=$vault/$arg.md
  destiny=`realpath -m $destiny`
  noteDir=`dirname $destiny`

  if [[ ! -d $noteDir ]]; then
    mkdir -p $noteDir
  fi

  editor=`get_editor`
  $editor $destiny
}
