#!/bin/zsh

# PATH to minikube and docker

export PATH=$PATH:/usr/local/bin

# Set minikube environment 

eval $(minikube docker-env)

# Backup date

today=$(date "+%Y_%m_%d-%H_%M_%S")

echo "Current date: $today"

# build up filename

# destination folder (change to your own needs)

BACKUP_FOLDER=$HOME/Dockers/fireflyiiik8s/dbbackups

file_name=$BACKUP_FOLDER/bkup_fireflyiii
new_name=$file_name-$today.sql
echo "Backup file name: " "$new_name"

docker exec `docker container ls | grep mysql_firefly | cut -f1 -d' '` /usr/bin/mysqldump -u root --password=Rey-1176 fireflyiii > $new_name

message="Backup stored "$today

sudo -u YOURUSERHERE echo $message | mail -s "FireflyIII backup finished" "creylopez@yahoo.es"
