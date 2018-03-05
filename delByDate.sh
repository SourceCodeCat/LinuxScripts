#!/bin/bash
echo "The script deletes the files that matches a date as 'Dec 30'"
echo "the format is the one from the ls command"
echo "------------------------------------------------------------"
DOI=$1

if [ "$DOI" = "" ]; then
        echo "a date is required..."
else
        ls -la --sort=time |grep "$DOI"| grep -v "delByDate.sh" |awk '{print $9}'| xargs rm -rf
fi

