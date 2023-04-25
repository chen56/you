FROM fischerscode/flutter:3.10.0-1.1.pre as base

ARG test=false

USER flutter:flutter

WORKDIR /home/flutter

COPY --chown=flutter:flutter . ./note

ENV PUB_HOSTED_URL="https://pub.flutter-io.cn"
ENV FLUTTER_STORAGE_BASE_URL="https://storage.flutter-io.cn"

RUN cd note && ./bake get

FROM base as ci

RUN pwd && ls

#RUN cd note && ./bake get \
#            && (  [[ "$test" == "true" ]] && ./bake test ) \
#            && ./bake build --base-href "/note/"
#RUN #cd note && echo "pub get" && (  [ "$test" = "false" ] && ./bake test )
# for test
#  docker run --rm -v $PWD/packages/note_app/build/web:/app -p 8000:80 denoland/deno:1.32.5 deno run --allow-env --allow-read --allow-sys --allow-net npm:http-server  /app --port 80  -g --brotli


#
#FROM node:19.9-alpine3.16 as prod
#
## The port that your application listens to.
#EXPOSE 80
#
#WORKDIR /app
#
## Prefer not to run as root.
#
#COPY --from=builder /home/flutter/note/packages/note_app/build/web /app/note
#RUN npm i -g http-server
#
## docker run --rm -p 80:80 younpc/note
#CMD ["http-server", "/app","--port" ,"80" , "-g","--brotli"]
