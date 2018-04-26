#!/bin/bash
awk -F "," '{print $2}' /tmp/key.csv | sed 1d | sort > /tmp/tmp1.txt
ls -l /home | awk -F " " '{print $9}'|sed 1d|sed /ccloud/d|sort > /tmp/tmp2.txt
diff /tmp/tmp1.txt /tmp/tmp2.txt > /tmp/del.txt
if [ $? == 0 ];then
exit 1
else
x=(`sed /^[0-9]/d /tmp/del.txt |sed 's/[<>]/ /g'`)
for i in ${x[@]}
do
sed -i /${i[@]}/d /etc/sudoers.d/90-cloud-init-users
/usr/sbin/userdel -r $i
done
fi
