adann0/samba-ldap:armv7
=======================

Docker image for SAMBA with ldap authentication.

This image is based on `andrespp/samba-ldap` and `osixia/openldap`.

# Quick Example

Take a look here https://github.com/adann0/openldap-armv7 or here https://gist.github.com/fntlnz/cf14feb5a46b2eda428e000157447309 for how to generate SSL certificate, replace volumes path in docker-compose.yml, passwords, domain... 

	git clone https://github.com/adann0/samba-ldap-armv7.git &&
	cd samba-ldap-armv7 &&
	docker-compose up -d
	
You should connect at https://ip:6443 and create a Samba Group, with a Samba User. You can try to connect to your server at smb://ip. If you have an issue like "You have to change your password" you can try :

	$ docker exec -ti <samba_ldap_container> /bin/bash
	# smbpasswd -a <user>
	
Verify if the modification is reported in LDAP via phpLDAPadmin and then retry to connect to Samba.

# ToDo :

	- Python script to create users
