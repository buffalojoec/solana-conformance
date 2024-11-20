#!/bin/bash

# rm -rf detected.txt

# ./run-tests.sh \
#     | grep -B 3 'custom_err: 69420' \
#     | awk '/Handling/ {gsub(".*/", "", $2); gsub("\\.\\.\\.$", "", $2); print $2}' \
#     > detected.txt

rm -rf detected_ussv.txt

./run-tests.sh \
    | grep -B 3 'result: 49' \
    | awk '/Handling/ {gsub(".*/", "", $2); gsub("\\.\\.\\.$", "", $2); print $2}' \
    > detected_ussv.txt
