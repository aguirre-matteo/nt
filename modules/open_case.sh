open_case()
{
  case $1 in
    ..*) open_prev $@
    ;;
    .|d|daily|today) open_daily ${@:2}
    ;;
    *) open_note $@
    ;;
  esac
}

__is_special_case()
{
   case $1 in
    ..*) echo true
    ;;
    .|d|daily|today) echo true
    ;;
    *) echo false
    ;;
  esac
}
