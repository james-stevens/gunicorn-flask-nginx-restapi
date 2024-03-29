# (c) Copyright 2019-2022, James Stevens ... see LICENSE for details
# Alternative license arrangements are possible, contact me for more information

FROM alpine:3.16

RUN apk update
RUN apk upgrade

RUN rmdir /run
RUN ln -s /dev/shm /run
RUN apk add nginx curl

RUN apk add python3 py3-flask py3-gunicorn
RUN apk add py3-requests

RUN apk add sysklogd
RUN rm -f /etc/syslogd.conf; ln -s /run/syslogd.conf /etc/syslogd.conf

RUN rmdir /tmp /var/lib/nginx/tmp /var/log/nginx 
RUN ln -s /dev/shm /tmp
RUN ln -s /dev/shm /var/lib/nginx/tmp
RUN ln -s /dev/shm /var/log/nginx
RUN ln -s /dev/shm /run/nginx

COPY myCA.pem myCA-2.pem /etc/ssl/private/
RUN cd /etc/ssl/private; cat myCA.pem myCA-2.pem >> /etc/ssl/cert.pem

RUN mkdir -p /usr/local/htdocs
COPY index.html /usr/local/htdocs

COPY bin /usr/local/bin/
RUN ln -fns /run/nginx.conf /etc/nginx/nginx.conf
RUN ln -fns /run/inittab /etc/inittab

CMD [ "/usr/local/bin/run_init" ]
