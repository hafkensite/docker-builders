current_dir := $(shell pwd)
PROJECT := $(notdir $(current_dir))

.PHONY: pull-base image shell run
image: Dockerfile *
	docker build . -f $< --tag $(PROJECT)

shell: image
	docker run \
	  --rm \
	  --volume $(current_dir):/project \
	  --tty \
	  --interactive \
	  $(PROJECT)

run: image
	docker run \
	  --rm \
	  --volume $(current_dir):/project \
	  $(PROJECT) $(ARGS)	

pull-base: Dockerfile
	grep -i '^FROM' $< | awk '{print $$2}' | xargs -n1 docker pull
