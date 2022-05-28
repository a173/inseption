FROM debian:buster

RUN apt-get update
RUN apt-get -y install nginx openssl

COPY conf/conf /etc/nginx/sites-available/conf
RUN  ln -s /etc/nginx/sites-available/conf /etc/nginx/sites-enabled/
RUN  rm /etc/nginx/sites-enabled/default

COPY tools/ssl.sh .
RUN sh ssl.sh && rm -rf ssl.sh

CMD ["nginx", "-g", "daemon off;"]