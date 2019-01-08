ROOT_DIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

php_extensions.zip:
	docker run --rm -v $(ROOT_DIR):/opt/layer lambci/lambda:build-nodejs8.10 /opt/layer/build.sh
	
upload: php_extensions.zip
	./upload.sh
	
publish: php_extensions.zip
	./publish.sh

clean:
	rm php_extensions.zip