#!/bin/sh

mkdir -p /var/lib/varnish/`hostname` && chown nobody /var/lib/varnish/`hostname`

sed -i "s/{{ VARNISH_BACKEND_HOST }}/${VARNISH_BACKEND_HOST}/g" /etc/varnish/default.vcl
sed -i "s/{{ VARNISH_BACKEND_PORT }}/${VARNISH_BACKEND_PORT}/g" /etc/varnish/default.vcl
sed -i "s/{{ VARNISH_BACKEND_FIRST_BYTE_TIMEOUT }}/${VARNISH_BACKEND_FIRST_BYTE_TIMEOUT}/g" /etc/varnish/default.vcl
sed -i "s/{{ VARNISH_BACKEND_CONNECT_TIMEOUT }}/${VARNISH_BACKEND_CONNECT_TIMEOUT}/g" /etc/varnish/default.vcl
sed -i "s/{{ VARNISH_BACKEND_BETWEEN_BYTES_TIMEOUT }}/${VARNISH_BACKEND_BETWEEN_BYTES_TIMEOUT}/g" /etc/varnish/default.vcl
sed -i "s/{{ VARNISH_ERRORS_TTL }}/${VARNISH_ERRORS_TTL}/g" /etc/varnish/default.vcl
sed -i "s/{{ VARNISH_GRACE }}/${VARNISH_GRACE}/g" /etc/varnish/default.vcl
sed -i "s#{{ VARNISH_SUBNET }}#${VARNISH_SUBNET}#g" /etc/varnish/default.vcl

varnishd -F -s malloc,${VARNISH_MEMORY} -a :80 -T :81 -f /etc/varnish/default.vcl
