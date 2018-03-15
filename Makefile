DOCKER = docker run --privileged -v $(shell pwd):/app crash sh -c
export PROTOBUF_VERSION=3.5.1

all:
	docker build --build-arg PROTOBUF_VERSION=$(PROTOBUF_VERSION) -t crash .
	$(DOCKER) 'cd /app && make proto'
	$(DOCKER) 'cd /app && make composer'
	$(DOCKER) 'cd /app && echo run -d extension=protobuf.so src/CrashCommand.php > debug && echo bt >> debug && gdb php -batch -x debug'

composer:
	sed -e 's/##PROTOBUF_VERSION##/$(PROTOBUF_VERSION)/' composer.json.tmpl > composer.json
	php composer.phar install

proto:
	mkdir -p gen-proto
	protoc --php_out gen-proto crash.proto
