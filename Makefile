HTMLFILE := html
CSSFILE := ./style.css
PANDOCOPT := --base-header=2 -f rst+smart -t $(HTMLFILE) -s

all: html

html: cv_html resume_html

pdf: cv_pdf resume_html

resume_html:
	pandoc --base-header=2 -f rst+smart -t html -s -c ./css/resume.css -o resume.html resume.rst

resume_pdf:
	pandoc --base-header=2 -f rst+smart -s -c ./css/resume.css --pdf-engine=weasyprint -o resume.pdf resume.rst

cv_html:
	pandoc --base-header=2 -f rst+smart -t html -s -c ./css/cv.css -o cv.html cv.rst

cv_pdf:
	pandoc --base-header=2 -f rst+smart -s -c ./css/cv.css --pdf-engine=weasyprint -o cv.pdf cv.rst
