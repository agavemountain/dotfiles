#!/bin/bash
# Sphynx is a documentation generator
#

IdentifyLinuxDistribution()
{
    # Determine OS platform
    UNAME=$(uname | tr "[:upper:]" "[:lower:]")
    # If Linux, try to determine specific distribution
    if [ "$UNAME" == "linux" ]; then
        # If available, use LSB to identify distribution
        if [ -f /etc/lsb-release -o -d /etc/lsb-release.d ]; then
            export DISTRO=$(lsb_release -i | cut -d: -f2 | sed s/'^\t'//)
        # Otherwise, use release info file
        else
            export DISTRO=$(ls -d /etc/[A-Za-z]*[_-][rv]e[lr]* | grep -v "lsb" | cut -d'/' -f3 | cut -d'-' -f1 | cut -d'_' -f1)
        fi
    fi
    # For everything else (or if above failed), just use generic identifier
    [ "$DISTRO" == "" ] && export DISTRO=$UNAME
    unset UNAME
}

case "$OSTYPE" in
  darwin*)  
    echo "Installing Sphinx [OSX]..." 
    # MacOS
    brew install sphinx-doc
    ;; 
  linux*)   
    echo "Installing Sphinx [LINUX]..." 
    IdentifyLinuxDistribution
    echo "distribution: $DISTRO"
    if [ "$DISTRO" = "Ubuntu" ]; then
        echo "apt-get install python3-sphinx"
        sudo apt-get install python3-sphinx
    fi
    ;;

  *)        echo "unknown: $OSTYPE" ;;
esac

# Centos/RHEL
#yum install python-sphinx

