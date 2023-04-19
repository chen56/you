FROM fischerscode/flutter:3.10.0-1.1.pre as builder

USER flutter:flutter

WORKDIR /home/flutter

COPY --chown=flutter:flutter . ./note

ENV PUB_HOSTED_URL="https://pub.flutter-io.cn"
ENV FLUTTER_STORAGE_BASE_URL="https://storage.flutter-io.cn"

#RUN echo $pwd > pwd
# https://docs.docker.com/engine/reference/builder/#run---mounttypebind
#RUN --mount=type=bind,target=./note  \
#    cd note/packages/note_app  && \
#    flutter build web -v --release --tree-shake-icons --web-renderer html --base-href "/note/"
RUN cd note && ./bake get
RUN cd note && ./bake build

FROM nginx as web
COPY static-html-directory /usr/share/nginx/html
COPY --from=builder /home/flutter/note/packages/note_app/build/web .

