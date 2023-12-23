#!/bin/bash
if [ -d "$1/Chronicles" ]; then
    rclone copy "$1/Chronicles" drive_latex:Chronicles/ --update --exclude "**/build/"
fi

if [ -d "$1/Works" ]; then
    rclone copy "$1/Works" drive_latex:Works/ --update --exclude "**/build/"
fi

if [ -d "$1/Exercises" ]; then
    rclone copy "$1/Exercises" drive_latex:Exercises/ --update --exclude "**/build/"
fi

if [ -d "$1/Articles" ]; then
    rclone copy "$1/Articles" drive_latex:Articles/ --update --exclude "**/build/"
fi
