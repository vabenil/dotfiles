#!/bin/sh

echo '{ "version": 1 }'

echo '['

echo '[]'

while :;
do
    echo ',['
        echo "
    {
        \"name\":\"Time\",
        \"full_text\": \"$(date +%r )\",
        \"separator\": false,
        \"separator_block_width\": 0
    }"
           
    echo ']'
    sleep 1
done
