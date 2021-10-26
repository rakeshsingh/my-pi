echo "Downloading influxdb"
wget -qO- https://repos.influxdata.com/influxdb.key | sudo apt-key add -
echo "deb https://repos.influxdata.com/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/influxdb.list
sudo apt update
sudo apt install influxdb -y
sudo systemctl unmask influxdb
sudo systemctl enable influxdb
sudo systemctl start influxdb

#setup users and database
echo "setting up users and database"
USER=`cat secrets/prod.influxdb |head -n1|tail -n1|cut -d":" -f2`
PASS=`cat secrets/prod.influxdb |head -n2|tail -n1|cut -d":" -f2`
echo $USER, $PASS
SQL_CREATE_USER="'CREATE USER $USER WITH PASSWORD $PASS WITH ALL PRIVILEGES'"
echo $SQL_CREATE_USER

influx -execute 'create database "speedtest"'
influx -execute $SQL_CREATE_USER -database "speedtest"
