RSTFILE := rst
HTMLFILE := html
PANDOC := pandoc
CSSFILE := ./style.css
RESUMENAME := resume
RESUMEFILE := ./$(RESUMENAME).$(RSTFILE)
RESUMEDEST := ./$(RESUMENAME).$(HTMLFILE)
PANDOCOPT := --base-header=2 -f $(RSTFILE) -t $(HTMLFILE) -s -S

SOURCE := $(shell find . -name "*.$(RSTFILE)")
HTMLSOURCE := $(patsubst %.$(RSTFILE), %.$(HTMLFILE), $(SOURCE))

all: rst_files resume_to_index

resume_to_index:
	cp resume.html index.html

rst_files: $(HTMLSOURCE)

$(HTMLSOURCE): %.$(HTMLFILE): %.$(RSTFILE)
	@$(PANDOC) $(PANDOCOPT) -c ./$(CSSFILE) -o $@ $<

clean:
	rm *.$(HTMLFILE)
