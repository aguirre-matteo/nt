if [[ -z $1 ]]; then
  browse_vault
  exit 0
fi



case $1 in
  browse) browse_vault
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
  ..*) open_prev $@
  ;;
  .|d|daily|today) open_daily ${@:2}
  ;;
  *) open_note $@
  ;;
esac

