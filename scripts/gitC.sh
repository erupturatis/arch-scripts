#!/bin/bash

usage="Usage: gitC.sh [--C|--F|--R|--D|--W|--S|--FI|--M] message"

if [ "$#" -ne 2 ]; then
    echo "Invalid arguments."
    echo $usage
    exit 1
fi

case "$1" in
    --C) MESSAGE="(create)[$2]" ;;
    --F) MESSAGE="(fix)[$2]" ;;
    --R) MESSAGE="(refactor)[$2]" ;;
    --D) MESSAGE="(delete)[$2]" ;;
    --W) MESSAGE="(working)[$2]" ;;
    --S) MESSAGE="(started)[$2]" ;;
    --FI) MESSAGE="(finished)[$2]" ;;
    --M) MESSAGE="(merged)[$2]" ;;

    *)
        echo "Invalid option: $1"
        echo $usage
        exit 1
        ;;
esac

echo "$MESSAGE"
git commit -m "$MESSAGE"
