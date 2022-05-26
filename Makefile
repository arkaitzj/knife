build:
	docker build -t arkaitzj/knife --target knife . 

run:
	docker run -it --rm arkaitzj/knife

push:
	docker push arkaitzj/knife
