ANIO=2022

all: martin-miguel-JTP-DE.pdf martin-miguel-JTP-DSE.pdf

martin-miguel-%.pdf: solicitud_de_inscripcion_%-${ANIO}.pdf cv.pdf plan_2022.pdf
	pdftk $^ cat output $@

cv.pdf: cv.tex
	pdflatex $^

solicitud_de_inscripcion_%-${ANIO}.pdf: solicitud_de_inscripcion_%-${ANIO}.doc
	libreoffice --convert-to pdf $<

plan_2022.pdf: plan_2022.tex
	lualatex $<
	bibtex $(subst tex,aux,$<)
	lualatex $<
	lualatex $<

clean:
	rm cv.aux cv.log  cv.out  
	rm plan_2022.aux plan_2022.bib plan_2022.out plan_2022.log

cleanall: clean
	rm cv.pdf
	rm plan_2022.pdf
