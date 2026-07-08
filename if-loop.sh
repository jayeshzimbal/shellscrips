
#write the shellscript to print numbers divided by 3 and 5 and not 15

#!/bin/bash

for i in {1..100}; do 

if (['expr $i % 3' == 0 ] || ['expr $i % 5' == 0 ]) && ['expr $i % 15' != 0 ];

then 
    echo $i
fi;
done