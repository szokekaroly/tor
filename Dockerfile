FROM centos:7
LABEL maintainer="szoke.karcsi@gmail.com"
COPY epel.repo /etc/yum.repos.d
RUN yum update -y && yum install epel-release -y && yum install tor -y && yum clean all
RUN echo "SocksPort 0.0.0.0:9050" >> /etc/tor/torrc 
RUN useradd tor && chown tor:tor /run/tor

EXPOSE 9050
VOLUME ["/var/lib/tor"]
USER tor
CMD ["/usr/bin/tor"]