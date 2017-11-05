FROM alpine:latest
RUN apk update && \
	apk add nano build-base py-pip python-dev libxml2-dev libxml2 libxml2-utils zlib-dev zlib libxslt libxslt-dev
RUN pip install --upgrade pip virtualenv setuptools && \
	mkdir -p /app && \
	cd /app && \
	virtualenv opcua
RUN	cd /app && \
	source opcua/bin/activate && \
	pip install opcua
ADD startup.sh /startup.sh
CMD /startup.sh
