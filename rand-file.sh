#!/bin/bash

set -o errexit

echoerr() { echo "$@" 1>&2; }

size=$1
count=$2

if test -z $1; then
    echoerr "Missing size argument"
    exit 1
fi

if test -z $2; then
    count=1
elif test $2 -lt 1; then
    echoerr "Count argument must be more than 1"
    exit 1
fi

basename=random-$1-

size=$(numfmt --from=iec $1)

for (( i=1; i <= count; i++ )); do
    file=${basename}${i}.bin
    head -c ${size} /dev/urandom > ${file}
    output="Verifying ${file}"
    length=${#output}
    printf "${output}"
    
    fileSize=$(stat --printf="%s" ${file})

    if test $fileSize -ne $size; then
        echoerr "File size miss match. Target: ${size} Actual: ${fileSize}"
        exit 1
    fi

    sha1sum ${file} > ${file}.sha1

    output=$(sha1sum -c ${file}.sha1)
    rm ${file}.sha1
    
    printf "\r"
    printf ' %.0s\r' {1..$length}
    echo "${output}"

done
