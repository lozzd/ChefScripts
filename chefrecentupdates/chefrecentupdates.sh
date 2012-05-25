#!/bin/bash

# Enable verbose mode if you want a bit more detail about what happened
VERBOSE=0
if [ x$1 == x"-v" ]
then
    VERBOSE=1
fi

echo "Finding Chef client logs..."
# For each Chef client log file... 
# You may need to update your path for this one. 
for i in `ls -rt /var/log/chef/client.log*`
do
    # Find the part of the file where the resources are updated. 
    COUNT=`zgrep -A 20 "Resources updated this run" $i | grep "INFO:  " | wc -l`
    if [ $COUNT -gt 0 ] 
    then
        echo "$COUNT resources updated in $i:"
        zgrep -A 20 "Resources updated this run" $i | grep "INFO:  " 
        echo
    else
        if [ $VERBOSE -eq 1 ] 
        then
            echo "Nothing updated in $i"
            echo
        fi
    fi
done

