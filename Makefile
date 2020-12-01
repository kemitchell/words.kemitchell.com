SOURCES=$(wildcard *.md)
COMMONMARK=node_modules/.bin/commonmark

all: $(addprefix site/,$(SOURCES:.md=.html))

site/%.html: %.md $(COMMONMARK) | site
	$(COMMONMARK) < $< > $@

$(COMMONMARK):
	npm ci

site:
	mkdir -p site

.PHONY: clean

clean:
	rm -rf site
