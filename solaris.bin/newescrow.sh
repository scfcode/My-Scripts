#! /bin/ksh
# sed script to illustrate 'quote'"matching"'usage'

sed -e '
   s/'"COUNT $OLDCOUNT"'/'"COUNT $NEWCOUNT"'/;
   s/END1/'"$NEWCOUNT"'/;    
   s/END2/'"$CNAME"'/;    
   s/END3/'"\<a href=\"http:\/\/jurassic.eng.sun.com\/%7Ecb117521\/cgi\/esc.cgi?esc=$ESCID\"\>$ESCID<\/a>"'/;
   s/END4/'"$SDATE"'/;
   s/END5/'"$EDATE"'/; 
   /<\/tbody>/i\
    <tr>\
      <td style=\"vertical-align: top;\">END1<br>\
      </td>\
      <td style=\"vertical-align: top;\">END2<br>\
      </td>\
      <td style=\"vertical-align: top;\">END3<br>\
      </td>\
      <td style=\"vertical-align: top;\">END4<br>\
      </td>\
      <td style=\"vertical-align: top;\">END5<br>\
      </td>
'