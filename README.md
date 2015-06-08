Meursault
=========
Meursault is a set of packages and configuration files built for an Ubuntu base
installation. It provides a desktop manager, a web browser, an editor, and
other essential software for a functional desktop for both novice and advanced
users.

Installation
------------
1. Clone this repository to a base/server installation of Ubuntu using `git clone https://github.com/jamesondh/meursault`.
2. Navigate to the directory with `cd meursault` and install with `./install.sh`.
3. That's it! The script will guide you through the process of choosing configuration settings if you did not create a config file.

Setting Defaults
----------------
Optionally, you can create a file called `meursault.conf` to facilitate
installation without prompting the user (e.g. choosing the software beforehand
rather than prompting the user). The easiest way to do this is to fork this
repository, rename `meursault.conf.template` to `meursault.conf`, and edit
that file as needed.
