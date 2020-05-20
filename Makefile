#

# Configuration
IMG := dellelce/varnish
IMGLITE := dellelce/varnish-lite
VARNISHVER = $$(docker run -it --rm $(IMG) varnishd -V|awk '{ gsub(/-/," "); } FNR==1 { print $$3 } ')

help:
	@echo Always use "help" as default

all: build
build: varnish varnishlite

varnish:
	@set -x && docker build -t $(IMG) . && docker tag $(IMG):latest $(IMG):$(VARNISHVER)

varnishlite:
	@docker build -t $(IMGLITE) lite && docker tag $(IMGLITE):latest $(IMGLITE):$(VARNISHVER)

vashell: varnish
	@docker run -it --rm $(IMG) sh

vashelllite: varnishlite
	@docker run -it --rm $(IMGLITE) sh

varun: varnish
	@docker  run -it --rm --network $(NET) --name varnish -p 8199:80 -v "$$PWD/cfg:/etc/varnish" $(IMG)

varunlite: varnishlite
	@docker  run -it --rm --network $(NET) --name varnish -p 8199:80 -v "$$PWD/cfg:/etc/varnish" $(IMGLITE)

push: varnish varnishlite
	@docker push $(IMG)
	@docker push $(IMGLITE)

clean:
	@docker rmi $(IMG) $(IMGLITE)

allcycle: all clean
