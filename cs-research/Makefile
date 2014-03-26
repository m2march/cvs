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
	rm $(ROOT)-$(LANG).aux
	rm $(ROOT)-$(LANG).out
	rm $(ROOT)-$(LANG).log
	rm $(ROOT)-$(LANG).pdf
