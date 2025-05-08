entrypoint=./main.sh
modules=$(find ./modules/ | grep ".sh$")

if [[ -d ./build ]]; then
  rm -rf ./build
fi

mkdir ./build
result=./build/nt.sh

for mod in $modules
do
  cat $mod >> $result
done

echo >> $result
echo >> $result
echo >> $result

cat $entrypoint >> $result

chmod +x $result
