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

---------------------

searching-01-describe-commands.sh
searching-02-verbose-cd.sh

We have 3 command types: built in, functions, and external. The search order is special built ins (such as the break and continue commands), functions, regualr built ins (such as cd and test), and external commands. The reason that shell functions are evaluated befor regular built in commands is that you may want to enhance or extend what a regular command does by creating a shell function that has the same name of that command.

The shell finds commands that are built in to the file system by first looking whether the command is built in, or a function, if not, it looks in the $PATH  variable.

If you have your own collection of programs and scripts, create your own directory that holds them and then add that directory to the $PATH variable.

To get the shell to find programs in the current directory we have two ways; first one is to use a null entry in the path variable, which will enable the $PATH variable to identify the scripts in the current directory > PATH=:PATH, the colon infront of the path variable is an empty entry, it represents the current directory. You can do this by having a colon at the front, two successive colons, or a colon at the end, or to make things clearer you can add ".:", where "." represents the current directory. This method is not very commonly used as it might create a security vulnerability.

The better way to do this is to create a dedicated directory where you keep your programs and scripts, and add it to the $PATH variable. We usually do this by adding a /bin in our home directory > mkdir $HOME/bin and then PATH=$HOME/bin:$PATH

If you created a shell function that has the same name as a built in command, to use the built in command instead of the shell function, use the "command" command.

use > type -p to know the full path of the program.