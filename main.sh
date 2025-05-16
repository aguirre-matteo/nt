if [[ -z $1 ]]; then
  open_fuz
  exit 0
fi



case $1 in
  fuz) open_fuz
  ;;
  browse) open_browser
  ;;
  init) init_vault ${@:2}
  ;;
  rm) rm_file ${@:2}
  ;;
  find) find_file ${@:2}
  ;;
  grep) grep_vault ${@:2}
  ;;
  ls) ls_vault ${@:2}
  ;;
  lt|tree) tree_vault ${@:2}
  ;;
  *) open_case $@
  ;;
esac

