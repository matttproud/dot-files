FIND ?= find
GIT ?= git
RM ?= rm -v

all: clean

clean:
	-$(FIND) -type f -iname '*~' -exec $(RM) '{}' ';'
	-$(FIND) -type f -iname '*#' -exec $(RM) '{}' ';'

update:
	$(GIT) pull

submit: clean update
	$(GIT) push

.PHONY: clean update submit