all: build

.PHONY: build
build: 
	echo '1' $@
	echo '1' $<
	echo '1' $^

# FLUTTER_WEB_CANVASKIT_URL对flutter run不起作用
.PHONY: chrome
chrome: 
	flutter run --web-renderer canvaskit --device-id chrome --web-renderer canvaskit --dart-define=FLUTTER_WEB_CANVASKIT_URL=https://cdn.jsdelivr.net/npm/canvaskit-wasm@0.37.1/bin/

# flutter run默认从unpkg下载canvaskit的wasm文件，经常下不下来，目前只能先build
.PHONY: server
server:
	flutter build web -v --release  --web-renderer canvaskit --dart-define=FLUTTER_WEB_CANVASKIT_URL=https://cdn.jsdelivr.net/npm/canvaskit-wasm@0.37.1/bin/ -t lib/src/notes/navigator/navigator_v2/3.1.navigator_v2_args_screen.dart
# 	npx http-server ./build/web --port 8080
	deno run --allow-env --allow-read --allow-sys --allow-net npm:http-server ./build/web --port 8080