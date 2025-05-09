open_browser()
{
  vault=`get_vault`
  browser=`get_browser`
  assert_vault
  $browser $vault
}
