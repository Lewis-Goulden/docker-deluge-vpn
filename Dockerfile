FROM lsiobase/alpine:3.6
MAINTAINER Lewis Goulden, Lewis-Goulden

# environment variables
ENV PYTHON_EGG_CACHE="/config/plugins/.python-eggs"

# set version label
ARG BUILD_DATE
ARG VERSION

# install build packages
RUN \
 apk add --no-cache --virtual=build-dependencies \
	g++ \
	gcc \
	libffi-dev \
	openssl-dev \
	py2-pip \
	python2-dev && \

# install runtime packages
 apk add --no-cache \
	openvpn \
	iptables \
	ca-certificates \
	curl \
	openssl \
	p7zip \
	unrar \
	unzip && \
 apk add --no-cache \
	--repository http://nl.alpinelinux.org/alpine/edge/main \
	libressl2.6-libssl && \
 apk add --no-cache \
	--repository http://nl.alpinelinux.org/alpine/edge/testing \
	deluge && \

# install pip packages
 pip install --no-cache-dir -U \
	incremental \
	pip && \
 pip install --no-cache-dir -U \
	crypto \
	mako \
	markupsafe \
	pyopenssl \
	service_identity \
	six \
	twisted \
	zope.interface && \

# cleanup
 apk del --purge \
	build-dependencies && \
 rm -rf \
	/root/.cache

# add local files
COPY root/ /

# ports and volumes
EXPOSE 8112 58846 58946 58946/udp
VOLUME /config /downloads
