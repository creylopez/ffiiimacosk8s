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
new_name=$file_name-$hoy.sql
echo "Backup file name: " "$new_name"

# You need to change the password and use the same you set in kustomization.yaml

docker exec `docker container ls | grep mysql_firefly | cut -f1 -d' '` /usr/bin/mysqldump -u root --password=CHANGEME fireflyiii > $new_name

message="Backup stored "$hoy

$HOME/Dockers/fireflyiiik8s/sendNotification $message
