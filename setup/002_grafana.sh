#install grafana
wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -
echo "deb https://packages.grafana.com/oss/deb stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list
sudo apt-get update
sudo apt-get install -y grafana

#enable grafana server
sudo /bin/systemctl enable grafana-server
# start grafana server
sudo /bin/systemctl start grafana-server
#print info
HOSTNAME=`hostname -I |cut -d" " -f1`
echo " At this moment you can open a browser and go to $HOSTNAME:3000, and you will be greeted with the Grafana login page. Grafana starts with the default username admin, and the default password admin. Make sure to change it."
