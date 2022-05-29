FROM alpine:3.12.3

RUN apk update
RUN apk upgrade
RUN apk add openrc
RUN apk add mariadb mariadb-client

COPY ./tools/start.sh .

CMD ["sh", "start.sh"]