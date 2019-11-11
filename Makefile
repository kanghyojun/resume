HTMLFILE := html
CSSFILE := ./style.css
RESUMENAME := resume
PANDOCOPT := --base-header=2 -f rst+smart -t $(HTMLFILE) -s

all: html

html:
	pandoc --base-header=2 -f rst+smart -t $html -s -c ./style.css -o resume.html resume.rst

pdf:
	pandoc --base-header=2 -f rst+smart -s -c ./style.css --pdf-engine=weasyprint -o resume.pdf resume.rst
