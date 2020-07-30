FROM linuxserver/radarr:latest
RUN apt-get -y update
RUN apt-get -y install wget nano gnupg
RUN wget -q -O - https://mkvtoolnix.download/gpg-pub-moritzbunkus.txt | apt-key add
RUN source /etc/lsb-release ; echo "deb https://mkvtoolnix.download/ubuntu/ $DISTRIB_CODENAME main" > /etc/apt/sources.list.d/mkvtoolnix.list
RUN apt-get -y update
RUN apt -y install mkvtoolnix
RUN mkdir /scripts
COPY scripts/ /scripts
RUN chmod 755 /scripts/stripr.sh
RUN apt-get -y upgrade && apt-get -y clean && apt-get -y --purge autoremove
