#!/bin/bash
#
# Install HP SDR repository for Centos 7
#

# pull the repository setup script from HP.
if [ ! -f add_repo.sh ]; then
	echo "Downloading add repository script."
	wget https://downloads.linux.hp.com/SDR/add_repo.sh
	chmod +x add_repo.sh
fi

# Install the repository files.
sudo ./add_repo.sh -d RedHat -r 7.0 spp

# intall the hp management agents:
sudo yum install hp-snmp-agents hpssa hp-health hp-smh-templates hpsmh hpssacli hponcfg
