FROM nginx:1.17.4

RUN apt-get update && apt-get install -y openssl
RUN mkdir -p /etc/nginx/ssl && mkdir -p /data

COPY default.conf /etc/nginx/conf.d/
COPY start.sh /
CMD ["/start.sh"]
