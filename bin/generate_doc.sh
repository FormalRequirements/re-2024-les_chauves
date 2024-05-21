

### EXTENSION PDF NOT WORKING YET
#MODE=$1

# Extension
#if [[  "$MODE" == "pdf" ]];
#then
#  EXT=".pdf";
#else
#  EXT=".html"
#fi
EXT=".html"

# Go through files and generate
FILES="$(ls ./in)"
PARENT_DIR="$(cd ../ | pwd)"

for FILE in $FILES
do
  BASENAME="$(basename $PARENT_DIR/in/$FILE .asciidoc)"
  asciidoctor $PARENT_DIR/in/$FILE -o $PARENT_DIR/out/$BASENAME$EXT;

  if [[ $? == 0 ]];
  then
    echo "$FILE  - OK"
  else
    echo "$FILE - NOK"
  fi
done

echo "DONE"
