# Running Coq, CoqIDE, and Proof General in a Vagrant box

## Benefits

- Get a working environment without installing any software on local machine
- Guaranteed to work out of the box, no configuration necessary

## Limitations

- You will have to install Virtualbox and Vagrant (100+ MB download)
- Your work and files will remain inside the virtual machine (unless you move them yourself, see below)

## Initial setup

1. Make sure you have VirtualBox 4.3+ and Vagrant installed.

2. Check out this repository and run the command `vagrant up` in the root directory of this repository. The commands are like this:

```
$ git clone https://github.com/winitzki/coq-vagrant.git
$ cd coq-vagrant
$ vagrant up
```

Make sure your VM instance is connected to the Internet (there may be a question about this during configuration of the instance).

If this is your first time using Vagrant, you will need to wait for a large download of Ubuntu Linux.

The Vagrant VM instance will be automatically provisioned to install Coq, Emacs, and Proof General.
It will also download the "Software Foundations" book and unpack the files into the directory `sf` under the user account.

After this initial step, you may need to shut down the virtual machine and start it up again from Virtualbox, in order for all changes to take effect.
To stop or start the VM from the command line, use these commands:

```
$ vagrant halt
$ vagrant up
```

## Running the VM

Currently, the machine runs in GUI mode with a very minimalistic graphical interface.

Another way is to use the graphical window. The username and password are both `vagrant` by default, but the box should log you in automatically.

You will see an empty window. Right-click with the mouse for a menu. You should see a "Proof General" menu item, which will start Emacs with Proof General.

The program `zathura` is available for viewing PDF files. You will need to run "terminal" first (the first item in the right-click menu).

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
This will start Emacs with Proof General as a text-only application.


## Copying files to and from the VM

When you run "vagrant up", you automatically mount the current directory as `/vagrant`. So you can copy files to the virtual machine like this:

On your machine, suppose that you cloned the repository to `/path/to/coq-vagrant`. Then execute this command for some file:

`cp some_file /path/to/coq-vagrant/some_file`

On the VM, this file will appear as `/vagrant/some_file`

Vice versa, any files you copy to `/vagrant/` on your VM will appear in `/path/to/coq-vagrant/`.

## Troubleshooting

If you need to change the `Vagrantfile`, reload the VM by the command

```
$ vagrant reload
```

"Provisioning" consists of executing the scripts `init_as_root.sh` and `init_as_user.sh`.

You can also repeat the provisioning when you start the VM:

```
$ vagrant up --provision
```

This will not download all the Ubuntu packages again - it will only redo the initial setup.

If all fails, you can remove the VM and start again:

```
$ vagrant destroy
$ vagrant up
```

