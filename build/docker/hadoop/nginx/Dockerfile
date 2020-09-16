FROM nginx:alpine

MAINTAINER Christos Ploutarchou<cploutarchou@gmail.com>

RUN rm /etc/nginx/nginx.conf /etc/nginx/conf.d/default.conf
COPY /build/docker/hadoop/nginx/default.conf /etc/nginx/conf.d/default.conf
COPY /build/docker/hadoop/nginx/materialize.min.css /data/bde-css/materialize.min.css
COPY /build/docker/hadoop/nginx/bde-hadoop.css /data/bde-css/bde-hadoop.css

