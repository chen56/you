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
FROM node:19.9-alpine3.16 as package

# The port that your application listens to.
EXPOSE 80

WORKDIR /app

# Prefer not to run as root.

COPY --from=ci /home/flutter/note/packages/note_app/build/web /app/note
RUN npm i -g http-server

# docker run --rm -p 80:80 younpc/note
CMD ["http-server", "/app","--port" ,"80" , "-g","--brotli"]


