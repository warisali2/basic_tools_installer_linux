#!/bin/bash

user="$1"

# Update the package list
sudo apt-get update

# Install VLC
if ! type vlc >/dev/null 2>&1 ; then
	echo -e  "\n\nINSTALLING VLC\n\n"; 
	sudo apt-get install -y vlc browser-plugin-vlc; 
fi

# Install VS Code
if ! type code >/dev/null 2>&1 ; then
	echo -e  "\n\nINSTALLING VS CODE\n\n";
	wget "https://go.microsoft.com/fwlink/?LinkID=760868" -O "/tmp/code.deb";
	sudo apt install -y "/tmp/code.deb";
	rm "/tmp/code.deb";
fi

# Install Python 3
if ! type python3 >/dev/null 2>&1 ; then
	echo -e  "\n\nINSTALLING PYTHON 3\n\n";
	sudo apt-get install -y python3 
fi

# Install pip3
if ! type pip3 >/dev/null 2>&1 ; then
	echo -e  "\n\nINSTALLING PIP3\n\n";
	sudo apt-get install -y python3-pip;
fi

# Install mkvirtualenv
echo -e  "INSTALLING VIRTUALENVWRAPPER";
if su - $user -c "pip3 install virtualenvwrapper"; then
	su - $user -c "echo -e  '\n# virtualenvwrapper configs' >> ~/.bashrc";
	su - $user -c "	echo -e  'export WORKON_HOME=$HOME/.virtualenvs' >> ~/.bashrc";
	su - $user -c "echo -e  'export PROJECT_HOME=$HOME/Devel' >> ~/.bashrc";
	su - $user -c "echo -e  'source /.local/bin/virtualenvwrapper.sh' >> ~/.bashrc";
	su - $user -c "source ~/.bashrc";
fi

# Install git
if ! type git >/dev/null 2>&1 ; then
	echo -e  "\n\nINSTALLING GIT\n\n";
	sudo apt-get install -y git;
fi
