FROM alpine:latest
RUN apk update && \
	apk add nano build-base py3-pip python3-dev libxml2-dev libxml2 libxml2-utils zlib-dev zlib libxslt libxslt-dev openssl libffi-dev openssl-dev
RUN pip3 install --upgrade pip virtualenv setuptools && \
	mkdir -p /app && \
	cd /app && \
	virtualenv opcua
RUN	cd /app && \
	source opcua/bin/activate && \
	pip install cryptography lxml python-dateutil pytz opcua
ADD startup.sh /startup.sh

EXPOSE 4840

CMD /startup.sh
