FROM fischerscode/flutter:3.22.0-31.0.pre.20 as ci

ARG test=off

COPY --chown=flutter:flutter ./ ./you

#RUN echo 'Please use china net, Because we use flutter-io.cn host_mirror'
#ENV PUB_HOSTED_URL="https://pub.flutter-io.cn"
#ENV FLUTTER_STORAGE_BASE_URL="https://storage.flutter-io.cn"

WORKDIR ./you

RUN ./bake install
RUN if [[ "$test" = "on" ]]; then ./bake test ; fi
RUN ./bake build
RUN pwd
RUN ls -l

#
######################################################################
# package
######################################################################
FROM nginx:1.23.4 as nginx
# ref:
# https://github.com/nginxinc/docker-nginx/blob/master/mainline

COPY --from=ci /home/flutter/you/notes/flutter_web/build/web /usr/share/nginx/html/

# The port that your application listens to.
EXPOSE 443
EXPOSE 80

# WORKDIR /app

RUN rm /etc/nginx/conf.d/*

COPY nginx/ /etc/nginx/

