#write a script to calculate number of "s" in mississipii

#!/bin/bash
x=mississipii
grep -o "s" <<<"$X" | wc -l   # wc = word count - list (wc -l )

 # grep - only "s " from $x ( grep -o "s"<<<"$x")