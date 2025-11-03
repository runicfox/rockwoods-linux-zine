# Makefile for Rockwood Linux Zine

ISSUE ?= issue-01
OUTPUT_DIR = output
CONTENT_DIR = content/$(ISSUE)
TEMPLATE = templates/zine-template.tex
HTML_TEMPLATE = templates/zine-template.html

all: pdf html

pdf:
	pandoc $(CONTENT_DIR)/*.md \
		--from markdown \
		--template=$(TEMPLATE) \
		--metadata-file=templates/metadata.yaml \
		--pdf-engine=xelatex \
		-o $(OUTPUT_DIR)/$(ISSUE).pdf

html:
	pandoc $(CONTENT_DIR)/*.md \
		--from markdown \
		--template=$(HTML_TEMPLATE) \
		--metadata-file=templates/metadata.yaml \
		-o $(OUTPUT_DIR)/$(ISSUE).html

clean:
	rm -f $(OUTPUT_DIR)/$(ISSUE).pdf $(OUTPUT_DIR)/$(ISSUE).html

.PHONY: all pdf html clean

