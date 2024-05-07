build:
	docker build -t arkaitzj/knife --target knife . 

build_multi:
	docker buildx build \
		--platform linux/arm64/v8,linux/amd64 \
		-t arkaitzj/knife \
		.
run:
	docker run -it --rm arkaitzj/knife

push:
	docker buildx build \
		--push \
		--platform linux/arm64/v8,linux/amd64 \
		-t arkaitzj/knife \
		.
