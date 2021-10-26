# enable ssh 
sudo touch /boot/ssh
#refresh available packages
sudo apt update
#perform system upgrade
sudo apt upgrade -y
#install common tools, git, curl, wget
sudo apt install git -y
sudo apt install python3 -y
sudo apt install curl -y
sudo apt install wget -y
sudo apt install vim -y
