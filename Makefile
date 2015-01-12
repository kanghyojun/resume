PORTFOLIODIR := ./projects
RSTFILE := rst
HTMLFILE := html
PANDOC := pandoc
CSSFILE := ./style.css
RESUMENAME := resume
RESUMEFILE := ./$(RESUMENAME).$(RSTFILE)
RESUMEDEST := ./$(RESUMENAME).$(HTMLFILE)
PANDOCOPT := --base-header=2 -f $(RSTFILE) -t $(HTMLFILE) -s -S

SOURCE := $(shell find $(PORTFOLIODIR) -name "*.$(RSTFILE)")
HTMLSOURCE := $(patsubst %.$(RSTFILE), %.$(HTMLFILE), $(SOURCE))

all: resume portfolio

resume:
	@$(PANDOC) $(PANDOCOPT) -c $(CSSFILE) -o $(RESUMEDEST) $(RESUMEFILE)

portfolio: $(HTMLSOURCE)

$(HTMLSOURCE): %.$(HTMLFILE): %.$(RSTFILE)
	@$(PANDOC) $(PANDOCOPT) -c ../$(CSSFILE) -o $@ $<

clean:
	rm $(PORTFOLIODIR)/*.$(HTMLFILE)
	rm ./$(RESUMENAME).$(HTMLFILE)
