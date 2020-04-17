dev:
	docker run -it --rm -v $(shell pwd):/srv/http:ro -p 8043:8043 pierrezemb/gostatic

build:
	docker build . -t stojg/slides.stojg.se

run: build
	docker run --rm -it -p 8043:8043 stojg/slides.stojg.se

push: build
	docker build . -t stojg/slides.stojg.se:latest -t stojg/slides.stojg.se:$(shell git rev-parse --verify HEAD)
	docker push stojg/slides.stojg.se