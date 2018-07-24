#!/usr/bin/make -f

ROLE_NAME:=go-dev

.DEFAULT_GOAL := apply
.PHONY: apply

DEFAULT_IMAGE:=centos7
IMAGE:=$(shell echo "$${IMAGE:-$(DEFAULT_IMAGE)}")

clean:
	@docker-compose rm -fs $(IMAGE)

start:
	@docker-compose up -d $(IMAGE)

shell: start
	@docker exec -it $(IMAGE) bash

test: start
	@docker exec $(IMAGE) ansible --version
	@docker exec $(IMAGE) wait-for-boot
	@docker exec $(IMAGE) ansible-galaxy install -r /etc/ansible/roles/default/tests/requirements.yml
	@docker exec $(IMAGE) env ANSIBLE_FORCE_COLOR=yes \
		ansible-playbook /etc/ansible/roles/default/tests/playbook.yml

apply:
	@mkdir -p target/ .ansible/galaxy-roles
	@rsync --delete --exclude=.ansible/galaxy-roles -a ./ .ansible/galaxy-roles/$(ROLE_NAME)/
	@ansible-galaxy install -p .ansible/galaxy-roles -r requirements.yml
	@ansible-playbook -i localhost, --ask-become-pass local.yml
