#!/bin/bash
#
# Generate key for Github.com
#
# This script will check to see if a key has been 
# generated and if not, generate one and copy it
# into the clipboard.
#

add_to_ssh_agent() 
{
    eval "$(ssh-agent -s)"

    if [ "$(uname)" == "Darwin" ]; then
        ssh-add -K ~/.ssh/id_rsa
    else
        ssh-add ~/.ssh/id_rsa
    fi 

}

# Copy to clipboard for mac
key_to_clipboard()
{
   if [ "$(uname)" == "Darwin" ]; then
        # wait for the user to add it to github
        pbcopy < ~/.ssh/id_rsa.pub
    else
        # Downloads and installs xclip. If you don't have `apt-get`, you might need to use another installer (like `yum`)
        sudo apt-get install xclip -y
        xclip -sel clip < ~/.ssh/id_rsa.pub
    fi
}

if [ -f ~/.ssh/id_rsa ]; then
    echo "Secret key file already found.  Aborting?"
    exit
fi

echo "This script will generate a new key to be used as your github key."
echo "Enter you email address.  This will be appended into the key."
read -r email
echo "email = $email"

if [ ! -f ~/.ssh/id_rsa ]; then
    echo "SSH key not found.  Generating...!"
    # generate a new, strong rsa ssh key
    echo "** GENERATING NEW KEY **"
    ssh-keygen -t rsa -b 4096 -C "$email"

    add_to_ssh_agent
    key_to_clipboard

    echo "Now login to https://github.com/settings/keys and add the key that has already been copied to your clipboard."
    read -p "Press any key to continue. Ctrl-C to abort."
fi

