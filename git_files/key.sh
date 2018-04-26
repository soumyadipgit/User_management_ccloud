#!/bin/sh
#user creation
x=`awk -F "," '{print $2}' /tmp/key.csv | sed 1d`
y=`awk -F "," '{print $3}' /tmp/key.csv | sed 1d`
if [ -z "$x" ] && [ -z "$y" ];then
echo "The usernames or public keys are not present"
exit 1
else
for i in $x
do
username=$i
/usr/sbin/useradd $i
mkdir -p /home/$i/.ssh
#key addition
cat /tmp/pub_keys/$i.txt > /home/$i/.ssh/authorized_keys
#permissions
chown -R  $i: /home/$i/.ssh/
chmod 600 /home/$i/.ssh/authorized_keys
done
fi
