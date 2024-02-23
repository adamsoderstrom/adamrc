function smackdown () {
  netstat -anp 2> /dev/null |
  grep :$@ |
  egrep -o "[0-9]+/node" |
  cut -d'/' -f1 |
  xargs kill;
}
