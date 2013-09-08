TEX=pdflatex 

CV=MMiguel-CV-20130217-en.pdf
SRC_MAIN=MMiguel-CV-20130217-en.tex

$(CV): $(SRC_MAIN) transcript.tex
	$(TEX) $(SRC_MAIN)

transcript.tex : transcript.txt transcript2tex.rb
	ruby transcript2tex.rb > $@


	
