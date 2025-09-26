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

I will ditch this approach because the github runner could not access the vm because it is not publicly accessible since it is hosted locally on my machine, I will use local git hooks instead. apparently git hooks work locally, so they will work on my actual local machine, not on the vm. There is nothing to do here but pull manually to th vm.

To see which shell you are using
echo $SHELL

To see where your bash directory is located
which bash

look into /dev/tty
look into stty - set terminal ("tty")
look into tr - Transilterate or delete character
look into od - octal dump
look into tee - "Pipe fitting"
look into date - print the date with formatting control

----------------------

You should:
Capture standard error when appropriate.
Throw output away if you don't need it.
Use here documents (EOF) instead of separate data files.
Use /dev/tty (and stty) to communicate with user, since standard error and standard output can be redirected, /dev/tty should give you a human being to talk to.