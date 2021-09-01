.PHONY: build frames run cli push

build:
	docker build -t pixterm-movie --progress=plain .
	docker images pixterm-movie

frames: MOVIE ?= movie.avi
frames: FPS ?= 1/20
frames:
	rm -rf ./frames && mkdir ./frames
	docker run --rm -it -v $$(pwd):/srv -w /srv jrottenberg/ffmpeg:3.4-scratch -i ${MOVIE} -filter:v fps=fps=${FPS} frames/%0d.jpg

run: SEEK ?= 0
run: SLEEP ?= 0.2
run: ONCE ?= 0
run:
	docker run --rm -it -e SEEK=${SEEK} -e SLEEP=${SLEEP} -e ONCE=${ONCE} pixterm-movie

cli:
	docker run --rm -it pixterm-movie bash

push: TAG ?= latest
push:
	docker tag pixterm-movie lukaszlach/avi:${TAG}
	docker push lukaszlach/avi:${TAG}