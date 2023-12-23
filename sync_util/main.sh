#!/bin/bash
export WORKSPACE_FOLDER=$1
export FILE_DIRNAME=$2
export RELATIVE_FILE=$3
export FILE_PATH=$4

# Build latex doc
echo "Building LaTex document." $WORKSPACE_FOLDER
bash $WORKSPACE_FOLDER/sync_util/build_latex.sh $FILE_PATH $FILE_DIRNAME

# Wait for build and copy pdf out
build_process_id=$!
wait $build_process_id
echo "Extracting builded PDF."
cp $FILE_DIRNAME/build/*.pdf $FILE_DIRNAME -u

# Sync to gdrive with rclone
echo "Syncing with Google Drive."
bash $WORKSPACE_FOLDER/sync_util/sync_on_save.sh $FILE_DIRNAME $RELATIVE_FILE

# Commit to gh
echo "Pushing to GitHub."
bash $WORKSPACE_FOLDER/sync_util/push_with_date.sh
