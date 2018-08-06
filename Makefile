#!/usr/bin/make -f

.DEFAULT_GOAL := apply
.PHONY: apply

DEFAULT_IMAGE:=centos7
IMAGE:=$(shell echo "$${IMAGE:-$(DEFAULT_IMAGE)}")

OS:=$(shell uname | tr '[:upper:]' '[:lower:]')

# LINUX ONLY ------------------------------------------------------------------
ifeq ($(OS),linux)
clean-linux:
	@docker-compose rm -fs $(IMAGE)

start-linux:
	@docker-compose up -d $(IMAGE)

test-linux: start
	@docker exec $(IMAGE) ansible --version
	@docker exec $(IMAGE) wait-for-boot
	@docker exec $(IMAGE) ansible-galaxy install -r /etc/ansible/roles/default/tests/requirements.yml
	@docker exec $(IMAGE) env ANSIBLE_FORCE_COLOR=yes \
		ansible-playbook /etc/ansible/roles/default/tests/playbook.yml

install-linux:
	@true

install: install-linux
clean: clean-linux
start: start-linux
test: test-linux

shell: start
	@docker exec -it $(IMAGE) bash
endif

# OSX ONLY --------------------------------------------------------------------
ifeq ($(OS),darwin)
clean-osx:
	@true

start-osx:
	@true

test-osx: start
	@mkdir -p .ansible/galaxy-roles
	@rsync --delete --exclude=.ansible/galaxy-roles -a ./ .ansible/galaxy-roles/default/
	@ansible-galaxy install -p .ansible/galaxy-roles -r tests/requirements.yml
	@ansible-playbook -c local -i 127.0.0.1, tests/playbook.yml

install-osx:
	@brew install python@2 >/dev/null
	@brew link --overwrite python >/dev/null
	@brew install ansible >/dev/null
	@echo "Dumping Debug Information..."
	@echo "Python Version:  $$(python --version)"
	@echo "pip Version:     $$(pip --version)"
	@echo "Ansible Version: $$(ansible --version)"

install: install-osx

clean: clean-osx
start: start-osx
test: test-osx
endif
