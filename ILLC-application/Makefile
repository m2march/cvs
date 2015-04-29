

mmiguel-illc-application.pdf: illc-application-cover.pdf illc-application-letter.pdf cs-research/MMiguel-CV-en.pdf
	pdftk $^ cat output $@

illc-application-cover.pdf: illc-application-cover.tex
	pdflatex -q $<

illc-application-letter.pdf: illc-application-letter.tex
	pdflatex -q illc-application-letter.tex

cs-research/MMiguel-CV-en.pdf:
	make -C cs-research MMiguel-CV-en.pdf
