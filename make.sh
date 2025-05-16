SRC=`realpath $0`
SRC=`dirname $SRC`

if [[ $# -gt 1 ]]; then
  echo "Error: expected >=1 arguments. Got $#"
  exit 1
fi 

DESTINY=$1
if [[ $# -eq 0 ]]; then
  DESTINY=$SRC/build/nt.sh
fi

if [[ -d $DESTINY ]]; then
  echo "Error: $DESTINY is a directory."
  exit 1
fi

entrypoint=$SRC/main.sh
modules=$(find $SRC/modules/ | grep ".sh$")

if [[ -d $SRC/build ]]; then
  rm -rf $SRC/build
fi

mkdir -p $(dirname $DESTINY)

for mod in $modules
do
  cat $mod >> $DESTINY
done

echo >> $DESTINY
echo >> $DESTINY
echo >> $DESTINY

cat $entrypoint >> $DESTINY

chmod +x $DESTINY
