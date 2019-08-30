#Dockerfile 4 FHEM a Perl based home automation server
FROM ubuntu:16.04
RUN apt-get update
RUN apt-get -y install perl-base libdevice-serialport-perl libwww-perl libio-socket-ssl-perl libcgi-pm-perl libjson-perl sqlite3 libdbd-sqlite3-perl libtext-diff-perl libtimedate-perl libmail-imapclient-perl libgd-graph-perl libtext-csv-perl libxml-simple-perl liblist-moreutils-perl ttf-liberation libimage-librsvg-perl libgd-text-perl libsocket6-perl libio-socket-inet6-perl libmime-base64-perl libimage-info-perl libusb-1.0-0-dev libnet-server-perl
RUN apt-get -y install libdate-manip-perl libhtml-treebuilder-xpath-perl libmojolicious-perl libxml-bare-perl libauthen-oath-perl libconvert-base32-perl libmodule-pluggable-perl libnet-bonjour-perl libcrypt-urandom-perl
RUN apt-get -y install wget
# this is the server script
RUN wget http://fhem.de/fhem-5.9.deb
RUN dpkg -i fhem-5.9.deb
# for the production version this will be the config file
COPY fhem.cfg /opt/fhem/fhem.cfg
# let´s run the server in demo mode
CMD perl fhem.pl fhem.cfg.demo
# the container starts with docker run -w /opt/fhem -p 8083:8083 -v log:/opt/fhem/log <image_name>
