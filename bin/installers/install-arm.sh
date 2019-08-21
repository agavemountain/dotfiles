#!/bin/bash
#
# Install ARM GCC compilers
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
    echo "Installing ARM [OSX]..." 
    # MacOS
    # to be implemented
    ;; 
  linux*)   
    echo "Installing ARM GCC COMPILERS [LINUX]..." 
    IdentifyLinuxDistribution
    echo "distribution: $DISTRO"
    if [ "$DISTRO" = "Ubuntu" ]; then
        echo "apt-get install install libc6-armel-cross libc6-dev-armel-cross binutils-arm-linux-gnueabi libncurses5-dev"
        sudo apt-get install install libc6-armel-cross libc6-dev-armel-cross binutils-arm-linux-gnueabi libncurses5-dev
        echo "sudo apt-get install gcc-arm-linux-gnueabihf g++-arm-linux-gnueabihf"
        sudo apt-get install gcc-arm-linux-gnueabihf g++-arm-linux-gnueabihf
        echo "sudo apt-get install gcc-arm-linux-gnueabi g++-arm-linux-gnueabi"
        sudo apt-get install gcc-arm-linux-gnueabi g++-arm-linux-gnueabi

        echo "checking"
        arm-linux-gnueabi-gcc -v
        arm-linux-gnueabihf-gcc -v
    fi
    ;;

  *)        echo "unknown: $OSTYPE" ;;
esac

# Centos/RHEL
#yum install ??


