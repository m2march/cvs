mmiguel-cv.pdf: presentacion.pdf cv.pdf 
	pdftk $^ cat output $@

presentacion.pdf: presentacion.tex
	pdflatex $<

cv.pdf: cv.tex cv/*.tex multilang.sty
	lualatex $^
