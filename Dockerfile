FROM fischerscode/flutter:3.10.0-1.3.pre as ci

COPY --chown=flutter:flutter . ./note

ENV PUB_HOSTED_URL="https://pub.flutter-io.cn"
ENV FLUTTER_STORAGE_BASE_URL="https://storage.flutter-io.cn"

WORKDIR ./note

RUN ./bake get
RUN ./bake build --base-href "/note/"
RUN ./bake test

#
######################################################################
# package
######################################################################
FROM nginx:1.23.4 as nginx
# ref:
# https://github.com/nginxinc/docker-nginx/blob/master/mainline

COPY --from=ci /home/flutter/note/packages/note_app/build/web /usr/share/nginx/html/note

# The port that your application listens to.
EXPOSE 443
EXPOSE 80

# WORKDIR /app

RUN rm /etc/nginx/conf.d/*

COPY nginx/ /etc/nginx/

