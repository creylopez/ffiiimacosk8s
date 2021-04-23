# Firefly III k8s on macOS Big Sur

Files needed to run Firefly III in Kubernetes (minikube) on macOS BitSur

* [mysql.yaml](mysql.yaml), to create a MySQL database.
* [firefly-iii.yaml](firefly-iii.yaml), to run Firefly III.
* [kustomization.yaml](kustomization.yaml), containing 
references to both and the necessary secrets.
* [firefly-iii-csv.yaml](firefly-iii-csv.yaml), csv importer (not launched, not tested)
* [phpmyadmin.yaml](phpmyadmin.yaml), phpMyAdmin admin panel.
* [loginFirefly](loginFirefly), used to login into Firefly contanier for debugging purposes.
* [conectFF](connectFF), open default web browser into Firefly.
* [conectPHP](connectPHP),  open default web browser into phpMyAdmin.

# Minikube

Please, refer to minikube web page for instructions on how to get minikube running on macOS

https://minikube.sigs.k8s.io/docs/start/

# Backup automation

To automate database backups the following file (crey is me, feel free to change it)

    com.crey.fireflyiibackup.plist

needs to be added to

    $HOME/Library/LaunchAgents

and then load it with

    launchctl load com.crey.fireflyiibackup.plist 

Usually, it should start automatically on system reboot. <== I need to work more on this. It does not work at system reboot. If I move it to system folders then the shell takes root as owner and it does not find docker.

Log files for this script are in /tmp/fireflyiii.err and /tmp/fireflyiii.out

interval is set in seconds in StartInterval.

