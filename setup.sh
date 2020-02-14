#!/bin/bash

echo "Running startup script"
export GOOGLE_APPLICATION_CREDENTIALS=/accounts/key.json
[ -f ${GOOGLE_APPLICATION_CREDENTIALS} ] && echo "Credentials exist." || echo "Credentials does not exist."

echo "Running fuse, Mounting GCP buckets"
gcsfuse -o nonempty <bucket-name-1> /<bucket-name-1>
gcsfuse -o nonempty <bucket-name-2> /<bucket-name-2>


echo "Running smb"
smbd --foreground --log-stdout