#!/bin/sh

cd <path_of_file_to_be_copied>
customdate="2022-12-09"
auth2=`cat .<secret_file> | openssl enc -base64 -d -aes-256-cbc -nosalt -pass pass:secret$file`

#secretfile can be created by below command
#echo '<password>' | openssl enc -base64 -e -aes-256-cbc -nosalt  -pass pass:secret$fle  > .<secretfile>


echo "*************************** Logs Transfter started  $(date) *********************** \n "

if [ -d <path_of_copy> ]; then

    echo " directory exists ... \n"

    cd <copy_path>
    sshpass -p $auth2 scp <username>@<IP>:<path_of_log_file>/<file_name>.${customdate}.*.log .

#changing file permission
    chmod 755 <copy_path>/*
else

  echo " directory dosent exist... creating the directory"

   cd <copy_path>
   mkdir <target-directory>

fi

echo "****************************** Logs Transfter End on  $(date) *************************** \n"
