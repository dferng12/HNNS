FROM nginx:1.17.4

RUN apt-get update && apt-get install -y openssl
RUN mkdir -p /etc/nginx/ssl && mkdir -p /data

COPY default.conf /etc/nginx/conf.d/
COPY ngrok /
COPY launch.sh /
ENTRYPOINT ["/bin/bash", "/launch.sh"]
