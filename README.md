# Joe's Dirty Little Dotfiles

This repository contains my configuration dot files and shell scripts
to automate the installation and tedious tasks.

This is a work in progress.  This repository will grow as I normalize 
my configurations between Mac OS, Ubuntu, CentOS, gentoo, and other 
Linux derivatives.

## Git
Git is one of the greatest source control tools ever created.  However, managing 
a large amount of repositories can be a pain.  Moreover, when working with multiple 
clients, multiple projects, multiple github accounts, multiple git servers, and contributing to a 
variety of git servers can make developing a tremendous hastle.  These scripts are intended to make
those chores a little less time wasting.

### gclone

Clone clone a list of repositories.  This script will look the repository list
file(s) and then clone all of the repositories (if they don't already exist on your local
system).  The cloned directories will be arranged in the following directory structure:  The 
clone repositories will be under the username/account.  For example, this repository
(dev-setup.git) is under my username (agavemountain).  

``` 
$ mkdir work_directory
(edit repository configuration files)
$ gclone 
```

## Github respository list(s)
Add a list of github repositories to a directory.  This list of repositories
will be used by the scripts to run commands on all the repositories.

### .github-repos

This is a simple text file that contains a list of github repositories to be
cloned, synchronized, etc.  The format is simple:

```<github user>/<git repo>```

This will be used to format the respository target(s):

```
git@github.com:<github user>/<git repo>.git
https://github.com/<github user>/<git repo>.git
``` 

### .local-repos

This text file contains the local paths to local (bare) git repositories.  Format is
the file path(s) to the local git repositories. NOTE: the configuration file must
have the entire path and not a relative ~.

Example:

```
/mnt/nfs/git/my_repo.git
```


