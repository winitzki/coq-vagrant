# Running Coq, CoqIDE, and Proof General in a Vagrant box

## Benefits

- Get a working environment without installing any software on local machine
- Guaranteed to work out of the box, no configuration necessary

## Limitations

- You will have to install Virtualbox and Vagrant (100+ MB download)
- Your work and files will remain inside the virtual machine

## Initial setup

1. Make sure you have VirtualBox 4.3+ and Vagrant installed.

2. Check out this repository and say `vagrant up` in its root directory.

Make sure your VM instance is connected to the Internet (there may be a question about this during configuration of the instance).

The Vagrant VM instance will be automatically provisioned to install Coq, Emacs, and Proof General.
It will also download the "Software Foundations" book and unpack the files into the directory `sf` under the user account.

## Running 

Currently, the machine runs in text mode. One way to run it is to ssh to it:

```
$ vagrant ssh
vagrant@precise64:~$ proofgeneral
```

This will start Emacs with Proof General.

Another way is to use the graphical window. The username and password are both `vagrant` by default.
