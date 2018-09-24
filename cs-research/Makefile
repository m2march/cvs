.PHONY: clean es cleanall

TEX=pdflatex 

ROOT=MMiguel-CV
LANG=en
CV=$(ROOT)-$(LANG).pdf
TRANSCRIPT=transcript-$(LANG).tex
SRC_MAIN=$(ROOT)-$(LANG).tex
LANGS=en es

mmiguel_new.pdf: mmiguel_new.tex $(TRANSCRIPT)
	xelatex $^

$(CV): $(SRC_MAIN) $(TRANSCRIPT) 
	$(TEX) $(SRC_MAIN)

$(TRANSCRIPT) : transcript-$(LANG).txt transcript2tex.rb
	ruby transcript2tex.rb transcript-$(LANG).txt > $@

clean:
	rm -f $(ROOT)-$(LANG).aux
	rm -f $(ROOT)-$(LANG).out
	rm -f $(ROOT)-$(LANG).log
	rm -f $(ROOT)-$(LANG).pdf
	rm -f transcript-$(LANG).tex 

es:
	make LANG=es

all:
	-make LANG=es
	-make LANG=en

cleanall:
	make LANG=es clean
	make LANG=en clean
