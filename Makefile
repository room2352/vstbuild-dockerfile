DOCKER = docker
REPO_NAME = room2352
IMAGE_NAME = vstbuild

image:
	$(DOCKER) build --pull -t "$(REPO_NAME)/$(IMAGE_NAME)" .

.PHONY: all
all: image

.PHONY: clean
clean:
	$(DOCKER) rmi -f $(REPO_NAME)/$(IMAGE_NAME) 2>/dev/null

