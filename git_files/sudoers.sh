awk -F "," '{print $2}' /tmp/key.csv | sed 1d | sort > /tmp/tmp1.txt
sed /#/d  /etc/sudoers.d/90-cloud-init-users | sed 1d | sed /ccloud/d | awk -F "ALL" '{print $1}'| sort> /tmp/tmp2.txt
diff -w -B /tmp/tmp1.txt /tmp/tmp2.txt > /tmp/del.txt
if [ $? == 0 ];then
exit 1
else
x=(`sed /^[0-9]/d /tmp/del.txt |sed 's/[<>]/ /g'`)
for i in ${x[@]}
do
echo "${i[@]} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/90-cloud-init-users
done
fi
