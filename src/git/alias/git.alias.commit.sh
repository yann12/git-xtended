#!/usr/bin/env bash

indexes=$@
split="--------------------------------------------------"

if [ "${indexes}" == "all" ] || [ "${indexes}" == "." ]; then
    printf "> git add all files & commit\n"
    git add .
    git status -s -u
    git commit -m ""
    exit 1
fi

if [ "${indexes}" == "" ]; then
    indexes=1
fi

status_i=0

git status -s | cut -c4- | while read path; do
    status_i=$((status_i + 1))
    for i in ${indexes}; do
        if [ "${status_i}" == "${i}" ]; then
            printf "> git add (%s) %s\n" ${i} ${path}
            git add ${path}
        fi
    done
done

printf "> & commit ...\n"

printf "%s\n" "${split}"
git status -s -u
printf "%s\n" "${split}"

git commit -m ""
