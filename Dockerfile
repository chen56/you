FROM fischerscode/flutter:3.19.0 as ci

ARG test=on

COPY --chown=flutter:flutter ./ ./note

#RUN echo 'Please use china net, Because we use flutter-io.cn mirror'
#ENV PUB_HOSTED_URL="https://pub.flutter-io.cn"
#ENV FLUTTER_STORAGE_BASE_URL="https://storage.flutter-io.cn"

WORKDIR ./note

RUN ./bake get
RUN if [[ "$test" = "on" ]]; then ./bake test ; fi
RUN ./bake build web_html --base-href "/note/"

#
######################################################################
# package
######################################################################
FROM nginx:1.23.4 as nginx
# ref:
# https://github.com/nginxinc/docker-nginx/blob/master/mainline

COPY --from=ci /home/flutter/note/spaces/flutter_note/build/web /usr/share/nginx/html/note

# The port that your application listens to.
EXPOSE 443
EXPOSE 80

# WORKDIR /app

RUN rm /etc/nginx/conf.d/*

COPY nginx/ /etc/nginx/

