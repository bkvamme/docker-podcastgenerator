#
FROM debian:buster-slim

LABEL maintainer="Oytun Deniz <oytun.deniz@gmail.com>" \
    name="podcastgenerator" \
    version="1.0"


ENV HOME /root

ENV DEBIAN_FRONTEND noninteractive

# Configure Apt
ADD sources.list /etc/apt/sources.list

RUN apt-get -qq update && \
    apt-get install -y --no-install-recommends nginx php-fpm php-xml ca-certificates unzip wget vim && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV PODCASTGEN_VERSION=3.1

EXPOSE 80

VOLUME [ "/var/www" ]


ADD php.ini /etc/php/7.3/fpm/php.ini
ADD nginx.conf /etc/nginx/nginx.conf
ADD default /etc/nginx/sites-available

ADD run.sh /run/run.sh
RUN chmod +x /run/run.sh


ENV LC_ALL C.UTF-8
ENV TERM xterm

CMD ["/run/run.sh"]
