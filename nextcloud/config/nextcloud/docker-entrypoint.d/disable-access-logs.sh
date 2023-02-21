#!/bin/sh

cd /var/log/apache2
rm -f *access*.log
ln -s /dev/null access.log
ln -s /dev/null other_vhosts_access.log
