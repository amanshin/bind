FROM phusion/baseimage

RUN \
  apt-get update && \
  apt-get install -y bind9 && \
  rm -rf /var/lib/apt/lists/*

RUN mkdir -m 0775 -p /var/run/named && \
    chown root:bind /var/run/named

ADD docker-entrypoint.sh /sbin/docker-entrypoint.sh
RUN chmod 755 /sbin/docker-entrypoint.sh

ENTRYPOINT ["/sbin/docker-entrypoint.sh"]

VOLUME ["/etc/bind", "/var/cache/bind", "/var/lib/bind"]

EXPOSE 53 53/udp

CMD ["/usr/sbin/named"]
