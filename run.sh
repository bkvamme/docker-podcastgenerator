#!/bin/bash 

DIR=/var/www/PodcastGenerator

wget -O /tmp/podcastgen.zip \
    https://github.com/PodcastGenerator/PodcastGenerator/releases/download/v${PODCASTGEN_VERSION}/PodcastGenerator-v${PODCASTGEN_VERSION}.zip


unzip /tmp/podcastgen.zip && \
    cp -r PodcastGenerator-${PODCASTGEN_VERSION}/PodcastGenerator/ /var/www && \
    chown -R www-data:www-data /var/www/ && \
    rm /tmp/podcastgen.zip

service php7.3-fpm start
service nginx start && tail -f /var/log/nginx/error.log
