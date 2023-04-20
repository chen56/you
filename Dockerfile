FROM fischerscode/flutter:3.10.0-1.1.pre as builder

USER flutter:flutter

WORKDIR /home/flutter

COPY --chown=flutter:flutter . ./note

ENV PUB_HOSTED_URL="https://pub.flutter-io.cn"
ENV FLUTTER_STORAGE_BASE_URL="https://storage.flutter-io.cn"

RUN cd note && ./bake get \
            && ./bake build

#FROM nginx as web
# for test
# docker run -v $PWD/packages/note_app/build/web:/web -v $PWD/note/docker/nginx.conf:/etc/nginx/nginx.conf -p 9999:80 nginx

#COPY --from=builder /home/flutter/note/packages/note_app/build/web /web/note
#COPY ./docker/nginx.conf /etc/nginx/nginx.conf



# for test
#  docker run --rm -v $PWD/packages/note_app/build/web:/app -p 8000:80 denoland/deno:1.32.5 deno run --allow-env --allow-read --allow-sys --allow-net npm:http-server  /app --port 80  -g --brotli
FROM node:19.9-alpine3.16

# The port that your application listens to.
EXPOSE 80

WORKDIR /app

# Prefer not to run as root.

COPY --from=builder /home/flutter/note/packages/note_app/build/web /app
RUN npm i -g http-server

# docker run --rm -p 80:80 younpc/note
CMD ["http-server", "/app","--port" ,"80" , "-g","--brotli"]
