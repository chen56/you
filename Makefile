all: build

.PHONY: build
build: 
	echo '1' $@
	echo '1' $<
	echo '1' $^

.PHONY: chrome
chrome: 
	flutter run --web-renderer html --device-id chrome

