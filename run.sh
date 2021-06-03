#!/bin/bash
set -e

url=
ulist=
fname=

print_help() {
    echo "This script is used to store all 200 status code url into a file
          Usage: $0 [-u <url>] [-l <url-list.txt>] [-f <file-name.txt>]"
    exit 1
}

exit_error() {
    echo "Error: -${OPTARG} requires an argument. use -h flag for help"
    exit 1
}

exit_empty() {
    echo "Error: requires an argument. use -h flag for help"
    exit 1
}

while getopts :u:l:f:h flag
do
    case "${flag}" in
        u) 
          url=${OPTARG}
          if [ -z $url ]; then
            echo "url shoudn't be empty. EX: http://example.com ."
            exit_error
            exit 1
          fi
          ;;
        l) 
          ulist=${OPTARG}
          if [ -z $ulist ]; then
            echo "Provide a list of uri to be included."
            exit_error
            exit 1
          fi
          ;;
        f) 
         fname=${OPTARG}
         if [ -z $fname ]; then
            echo "Provide a file name to store output urls"
            exit_error
            exit 1
         fi 
         ;;
        h)
          print_help
          exit 1
          ;;  
        :) 
          exit_error
          exit 1
          ;; 
    esac
done

if [ -z $url ] || [ -z $ulist ] || [ -z $fname ]; then
    exit_empty
    exit 1
else
    python get-200-urls.py $url $ulist $fname
fi


