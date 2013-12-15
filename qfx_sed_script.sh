:
for f in "$@"
do
    cp $1 $f.bak
    cat $f.bak | sed -e 's/<INTU.BID>.*/<INTU.BID>3350/' | sed -e 's/<INTU.USERID>.*/<INTU.USERID>5431/' >$f
done
