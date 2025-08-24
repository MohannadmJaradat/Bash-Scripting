# Bash-Scripting
the github action could not connect to the vm, to handle this, I had to do multiple things, such as installing openssh server using the following commands
sudo apt update
sudo apt install openssh-server -y
then checking if it is running or not, and then running and enabling it
sudo systemctl status ssh
sudo systemctl start ssh
sudo systemctl enable ssh
then we allowed ssh through firewall
sudo ufw allow ssh
to get the private ip address 
hostname -I