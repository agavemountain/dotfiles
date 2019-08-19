#!/bin/bash
#
# This will resolve errors like:
#
# Error: The `brew link` step did not complete successfully
# The formula built, but is not symlinked into /usr/local
# Could not symlink XXXX
# /usr/local/bin is not writable.
#

sudo chown -R `whoami`:admin /usr/local/bin
sudo chown -R `whoami`:admin /usr/local/share

