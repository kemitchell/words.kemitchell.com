SOURCES=$(wildcard *.md)

all: $(addprefix site/,$(SOURCES:.md=.html))

site/%.html: %.md | site
	npx commonmark < $< > $@

site:
	mkdir -p site

.PHONY: clean

clean:
	rm -rf site
