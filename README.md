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

Currently, the machine runs in GUI mode with a very minimalistic graphical interface.

This will start Emacs with Proof General as a text-only application.

Another way is to use the graphical window. The username and password are both `vagrant` by default, but the box should log you in automatically.

You will see an empty window. Right-click with the mouse for a menu. You should see a "Proof General" menu item, which will start Emacs with Proof General.

The program `zathura` is available for viewing PDF files. 

```
vagrant@precise64:~$ zathura cpdt.pdf &
```

Another available program is `mupdf`. 

```
vagrant@precise64:~$ mupdf -b 8 -r 200 cpdt.pdf &
```

Both `zathura` and `mupdf` have a very basic interface but are fast.

You can also use text-only mode by doing ssh to it:

```
$ vagrant ssh
vagrant@precise64:~$ proofgeneral
```
