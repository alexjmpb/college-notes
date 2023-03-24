relative_file=$2

rclone copy "$1/" drive_latex: --include "${relative_file%/*}/**" --update