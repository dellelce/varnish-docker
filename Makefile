#

# Configuration
IMG := dellelce/varnish
IMGLITE := dellelce/varnish-lite

help:
	@echo Always use "help" as default

all: build
build: varnish varnishlite

varnish:
	@docker build -t $(IMG) .

varnishlite:
	@docker build -t $(IMGLITE) lite

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
