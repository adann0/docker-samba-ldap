adann0/samba-ldap:armv7
=======================

Docker image for SAMBA with ldap authentication.

This image is based on `andrespp/samba-ldap` and `osixia/openldap`.

# Quick start

	git clone https://github.com/adann0/samba-ldap-armv7.git &&
	cd samba-ldap-armv7 &&
	docker-compose up -d
	
You should connect at https://<<ip>>:6443 and create a Samba Group, with a Samba User. You can try to connect to your server at smb://<ip>. If you have an issue like "You have to change your password" you can try :

	$ docker exec -ti <samba_ldap_container> /bin/bash
	# smbpasswd -a <user>
	
You change the password, verify if it's reported in LDAP via phpLDAPadmin and then retry to connect to Samba.
