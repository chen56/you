FROM fischerscode/flutter:3.10.0-1.1.pre as builder

USER flutter:flutter

WORKDIR /home/flutter

COPY --chown=flutter:flutter . ./note

ENV PUB_HOSTED_URL="https://pub.flutter-io.cn"
ENV FLUTTER_STORAGE_BASE_URL="https://storage.flutter-io.cn"

RUN cd note && ./bake get \
            && ./bake build

FROM nginx as web
COPY --from=builder /home/flutter/note/packages/note_app/build/web /web/note
COPY ./docker/nginx.conf /etc/nginx/nginx.conf

