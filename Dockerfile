FROM centos
RUN dnf update -y && dnf install epel-release -y && dnf install tor -y && dnf clean all
RUN echo "SocksPort 0.0.0.0:9050" >> /etc/tor/torrc 
RUN useradd tor
RUN chown tor:tor /run/tor

EXPOSE 9050
VOLUME ["/var/lib/tor"]
USER tor
CMD ["/usr/bin/tor"]