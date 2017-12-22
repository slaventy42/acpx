FROM lsiobase/alpine:3.7
			

# install packages and symlink libs
RUN \
 apk add --no-cache \
        wget \
        unzip \
	python2 \
	py-psutil \ 
	py-gevent \ 
	py-greenlet \ 
	py-requests \ 
	py-pip \
	nano \
	mc && \
	pip install bencode && \
 mkdir -p \
	/opt/tv && \
	
 # install aceproxy
 wget -o - https://github.com/pepsik-kiev/aceproxy/archive/master.zip -O aceproxy.zip && \
 unzip aceproxy.zip -d /opt/tv && \

# cleanup
 rm -rf \
	/tmp/*

# add local files
COPY root/ /

# ports and volumes
EXPOSE 8000 62062
VOLUME /opt/tv/aceproxy-master/plugins/config

