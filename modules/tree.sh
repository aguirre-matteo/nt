tree_vault ()
{
  if [[ $# -gt 1 ]]; then
    echo "Error: expected 0-1 arguments. Got $#."
    exit 1 
  fi 

  cmd=ls
  if command -v eza >/dev/null 2>&1; then
    cmd=eza
  fi 

  vault=`get_vault`
  path=$vault/$1
  path=`realpath -m $path`
  $cmd --tree $path
}
