#!/bin/bash
docker run --name zapscanner --rm -it \
	-e http_proxy=http://www-proxy.us.oracle.com:80 \
	-e https_proxy=http://www-proxy.us.oracle.com:80 \
	-v /home/draikes/.ssh:/home/user/.ssh \
	-v /tmp:/tmp \
	-u root \
	draikes30/ol7base:latest bash
