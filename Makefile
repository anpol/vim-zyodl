MD_FILES = $(wildcard *.md)
MD_HTML_FILES = $(patsubst %.md,%.html,$(MD_FILES))
MD_PDF_FILES = $(patsubst %.md,%.pdf,$(MD_FILES))

all : $(MD_HTML_FILES)

$(MD_HTML_FILES): %.html: %.md Makefile
	pandoc --from markdown+compact_definition_lists --to html --toc $< -o $@

$(MD_PDF_FILES): %.pdf: %.md Makefile
	pandoc --from markdown+compact_definition_lists --to latex --latex-engine=xelatex $< -o $@
