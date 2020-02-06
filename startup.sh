#!/bin/sh

CERT=opcua.com.cert.pem
KEY=opcua.com.key.pem

setup_cert() {
	openssl req \
    -new \
    -newkey rsa:4096 \
    -days 365 \
    -nodes \
    -x509 \
    -subj "/C=IT/ST=BZ/L=Bolzano/O=Endian/CN=www.endian.com" \
    -keyout opcua.com.key.pem \
    -out opcua.com.cert.pem
}

cd /app
source opcua/bin/activate
[ ! -f $CERT ] && setup_cert
uaserver -v INFO --populate --certificate $CERT --private_key $KEY
