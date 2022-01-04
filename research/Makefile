mmiguel-cv.pdf: cv.pdf 
	cp $^ $@

cv.pdf: cv.tex cv/*.tex multilang.sty
	lualatex $^
