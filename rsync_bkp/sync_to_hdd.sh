#!/bin/sh
today=`date +%Y-%m-%d%H%M%S`
logfile_name="Sync/logs/backup_avinash_"$today".log"
folder_list_file_name="Sync/backup_list.txt"
exclude_list_file_name="Sync/exclude_list.txt"
mount_point="/mnt/2tb_hdd"
echo 'the file name '$logfile_name
cd /home/avinash &&
if [ "$1" = "dryrun" ]; then
 echo 'dry run mode: nothing transferred'
 rsync --ignore-existing -vrltD --dry-run --files-from=$folder_list_file_name --exclude-from=$exclude_list_file_name / $mount_point  --log-file=$logfile_name
fi
if [ "$1" = "run" ]; then
 rsync --ignore-existing -vrltD --files-from=$folder_list_file_name --exclude-from=$exclude_list_file_name /  $mount_point --log-file=$logfile_name
fi
if [ "$1" = "" ]; then
 echo 'valid values are run/dryrun'
fi


