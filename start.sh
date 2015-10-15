#!/bin/bash

EXCLUDE_OPT=
PASS_OPT=

if [ "$1" == "backup" ]; then
    if [ -n "$2" ]; then
        file_list=$2

	file_name=fileback-$(date +%Y-%m-%d ).tar.gz

        tar -czf /tmp/$file_name $file_list

	aws s3 cp /tmp/$file_name s3://$S3_BUCKET/$S3_PATH/$file_name
	
	if [ $? == 0 ]; then
                rm /tmp/$file_name
        else
                >&2 echo "couldn't transfer $file_name to S3"
        fi

    else
       >&2 echo "You must give a file list to backup"
	
    fi
 
else
    >&2 echo "You must provide either backup or restore to run this container"
    exit 64
fi
