.PHONY: clean es cleanall

TEX=xelatex

ROOT=mmiguel
LANG=en
CV=$(ROOT)-$(LANG).pdf
TRANSCRIPT=transcript-$(LANG).tex
SRC_MAIN=$(ROOT)-$(LANG).tex
LANGS=en es

$(CV): $(SRC_MAIN) $(TRANSCRIPT) 
	$(TEX) $(SRC_MAIN)

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
