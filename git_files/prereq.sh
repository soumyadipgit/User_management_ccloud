echo "[all]" > /home/ccloud/git_files/inventory
openstack server list | sed '/+/d' | awk -F "|" '{ print $5}' | awk -F "=" '{ print $2}'| awk -F "," '{print $1}' >> /home/ccloud/git_files/inventory
