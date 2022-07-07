ANIO=2022

all: martin-miguel-JTP.pdf ./plan_2022.pdf

martin-miguel-%.pdf: solicitud_de_inscripcion_%-${ANIO}.pdf cv.pdf
	pdftk $^ cat output $@

cv.pdf: cv.tex
	pdflatex $^

solicitud_de_inscripcion_%-${ANIO}.pdf: solicitud_de_inscripcion_%-${ANIO}.doc
	libreoffice --convert-to pdf $<

plan_2022.pdf: plan_2022.tex
	pdflatex $<
	bibtex $(subst tex,aux,$<)
	pdflatex $<
	pdflatex $<

clean:
	rm cv.aux cv.log  cv.out  
	rm plan_2022.aux plan_2022.bib plan_2022.out plan_2022.log

cleanall: clean
	rm cv.pdf
	rm plan_2022.pdf
