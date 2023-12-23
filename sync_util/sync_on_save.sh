#!/bin/bash
export RELATIVE_FILE=$2

rclone copy "$1/" drive_latex:${RELATIVE_FILE%/*}/  --update --exclude "build/"
