#!/bin/bash
echo "Type your password"
if [[ ! $EUID -ne 0 ]]; then
echo "\n\033[1;31mEnter your root password.\033[m"
fi
sudo clear

### PRESENT MENU ###
Menu (){

read -p "This is only a prototype that jailbreak that I have made for Apple TV 2, just use seas0npass, this is will mess things up"

clear
echo "XtreamiOS 2.0 Prototype for Apple TV Script by LooneySJ"
echo "SSH tool by msftguy and SSH2_Bundle by DevTeam"
echo ""

show_Menu () {

echo "1.  Open SSH_rd"
echo "2.  Automatic install using SSH"
echo
echo "Q. Quit"

read SELECT

case "$SELECT" in

# Install Opensn0w and mkdir for it
1)
echo "Opening SSH client"
open ssh_rd_rev04b.jar
;;

2)
sleep 3s
expect -c"
spawn ssh root@localhost -p 2022 -o StrictHostKeyChecking=no
expect \"root@localhost's password:\"
send \"alpine\r\"
expect \"sh-4.0#\"
send \"mount.sh\r\"
expect \"sh-4.0#\"
send \"exit\r\"
expect \"closed.\"
"
echo "Please wait, System Processing"
sleep 5s
cd $0/Patch
expect -c"
spawn scp -P 2022 bin/tar bin/gzip root@localhost:/mnt1/bin
expect \"root@localhost's password:\"
send \"alpine\r\"
expect \"dummy expect\"
"
expect -c"
spawn scp -P 2022 bin/tar bin/gzip root@localhost:/bin
expect \"root@localhost's password:\"
send \"alpine\r\"
expect \"dummy expect\"
"
expect -c"
spawn scp -P 2022 SSH2_bundle.tgz root@localhost:/mnt1/
expect \"root@localhost's password:\"
send \"alpine\r\"
expect \"dummy expect\"
"
expect -c"
spawn scp -P 2022 fstab root@localhost:/mnt1/etc/
expect \"root@localhost's password:\"
send \"alpine\r\"
expect \"dummy expect\"
"
expect -c"
spawn scp -P 2022 Services.plist root@localhost:/mnt1/System/Library/Lockdown/
expect \"root@localhost's password:\"
send \"alpine\r\"
expect \"dummy expect\"
"
expect -c"
spawn scp -P 2022 lib.tgz root@localhost:/mnt2
expect \"root@localhost's password:\"
send \"alpine\r\"
expect \"dummy expect\"
"
expect -c"
spawn ssh root@localhost -p 2022
expect \"root@localhost's password:\"
send \"alpine\r\"
expect \"sh-4.0#\"
send \"cd /mnt1\r\"
expect \"sh-4.0#\"
send \"tar xzpf SSH2_bundle.tgz\r\"
expect \"sh-4.0#\"
send \"rm SSH2_bundle.tgz\r\"
expect \"sh-4.0#\"
send \"cd /mnt2\r\"
expect \"sh-4.0#\"
send \"tar xzpf lib.tgz\r\"
expect \"sh-4.0#\"
send \"rm lib.tgz\r\"
expect \"sh-4.0#\"
send \"halt\r\"
expect \"sh-4.0#\"
"
;;

*)
show_Menu
;;
esac

echo
read -sn 1 -p "Press any key to continue with this tool"
Menu
}
show_Menu
}
Menu
