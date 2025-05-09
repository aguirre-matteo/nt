get_conf_value ()
{
  if [[ ! $# -eq 1 ]]; then
    echo "Error: get_conf_value requires one argument. Got $#."
    exit 1
  fi 

  key=$1
  confFile=~/.config/nt
  value=$(grep "^${key}=" "$confFile" | cut -d'=' -f2)

  if [[ -z $value ]]; then
    echo "notfound"
  else
    echo $value
  fi
}

vault_path_unset_error()
{
  vault=`get_conf_value vault`
  if [[ $1 -eq 1 ]] || [[ $vault == "notfound" ]]; then
    echo "Error: vault path not set. Write it in the config file."
  fi
}

get_vault ()
{
  if [[ ! $# -eq 0 ]]; then
    echo "Error: get_vault doesn't expects arguments."
    exit 1
  fi 

  vault=`get_conf_value vault`
  if [[ $vault == "notfound" ]]; then
    vault_path_unset_error 1
    exit 1
  fi
  echo $vault
}

get_editor ()
{
  if [[ ! $# -eq 0 ]]; then
    echo "Error: get_editor doesn't expects arguments."
    exit 1
  fi 

  editor=`get_conf_value editor`
  if [[ $editor == "notfound" ]]; then
    editor=$EDITOR
  fi 
  echo $editor
}

get_browser() {
  if [[ ! $# -eq 0 ]]; then
    echo "Error: get_browser doesn't expects arguments."
    exit 1
  fi 
  
  browser=`get_conf_value file-manager`
  if [[ $browser == "notfound" ]]; then
    browser=cd
  fi 
  echo $browser
}
