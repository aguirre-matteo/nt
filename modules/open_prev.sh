open_prev ()
{
  if [[ ! $# -eq 1 ]]; then
    echo "Error: command expected only one argument."
    exit 1
  fi
  
  input=$1

  if [[ ! $input =~ ^\.\..*$ ]]; then
    echo "Error: string must start with '..'"
    echo "Got: $input"
    exit 1
  fi
  
  days=${input:2}
  if [[ -z $days ]]; then
    days=1
  fi

  if [[ ! $days =~ ^[0-9]+$ ]]; then 
    echo "Error: expected a number. Got $days."
    exit 1 
  fi

  prev=`date --date="$days days ago" --iso-8601`
  open_note daily/$prev
}
