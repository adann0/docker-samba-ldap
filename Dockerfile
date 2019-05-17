FROM arm32v7/debian:stretch

# Install NSS
RUN apt-get update && \
  apt-get install -y libnss-ldap && \
  rm -rf /var/lib/apt/lists/*

# /etc/nsswitch.conf
RUN file="/etc/nsswitch.conf" && \
	echo 'passwd:         files ldap' > $file && \
	echo 'group:          files ldap' >> $file && \
	echo 'shadow:         files ldap' >> $file && \
	echo 'gshadow:        files' >> $file && \
	echo '' >> $file && \
	echo 'hosts:          files dns' >> $file && \
	echo 'networks:       files' >> $file && \
	echo '' >> $file && \
	echo 'protocols:      db files' >> $file && \
	echo 'services:       db files' >> $file && \
	echo 'ethers:         db files' >> $file && \
	echo 'rpc:            db files' >> $file && \
	echo '' >> $file && \
echo 'netgroup:       nis' >> $file

# Install NSS
RUN apt-get update && \
  apt-get install -y samba

COPY entrypoint.sh /usr/bin/

EXPOSE 137/udp 138/udp 139 445

ENTRYPOINT ["entrypoint.sh"]
