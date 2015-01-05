.PHONY: clean es

TEX=pdflatex 

ROOT=MMiguel-CV
LANG=en
CV=$(ROOT)-$(LANG).pdf
SRC_MAIN=$(ROOT)-$(LANG).tex

$(CV): $(SRC_MAIN) transcript.tex
	$(TEX) $(SRC_MAIN)

transcript.tex : transcript.txt transcript2tex.rb
	ruby transcript2tex.rb > $@

clean:
	rm -f $(ROOT)-$(LANG).aux
	rm -f $(ROOT)-$(LANG).out
	rm -f $(ROOT)-$(LANG).log
	rm -f $(ROOT)-$(LANG).pdf

es:
	make LANG=es
