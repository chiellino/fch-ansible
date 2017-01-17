#!/bin/bash

# fix NFS server names in /etc/fstab 

FSTAB=/etc/fstab

# functions
function nfsserver2nas {
	sed -E -i 's/^(\bnfsserver\b)(.*)?*/nas\2/' $FSTAB
	exit 0
}

function nas2nfsserver {
	sed -E -i 's/^(\bnas\b)(.*)?*/nfsserver\2/' $FSTAB
	exit 0
}
#-----

name=$1

case ${name} in
	nas)
		nfsserver2nas
	;;
	nfsserver)
		nas2nfsserver
	;;
	*) exit 1
	;;
esac

