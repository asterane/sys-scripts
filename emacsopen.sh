#!/bin/bash

emacsclient -ne "(> (length (frame-list)) 1)" | grep -q t
if [ "$?" = "1" ]; then
    emacsclient -cna "" "$@"
else
    emacsclient -na "" "$@"
fi
