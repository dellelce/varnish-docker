#

# Configuration
DKRIMG := varnish-swarm

help:
	@echo Always use "help" as default

all: varnish
build: varnish

varnish:
	@docker build -t $(DKRIMG) .

vashell: varnish
	@docker run -it --rm $(DKRIMG) sh

varun: varnish
	@docker  run -it --rm --network $(NET) --name varnish -p 8199:80 -v "$$PWD/cfg:/etc/varnish" $(DKRIMG)

clean:
	@docker rmi $(DKRIMG)

allcycle: all clean

sh: all

