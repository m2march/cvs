ANIO=2022

all: martin-miguel-JTP.pdf 

martin-miguel-%.pdf: solicitud_de_inscripcion_%-${ANIO}.pdf cv.pdf
	pdftk $^ cat output $@

cv.pdf: cv.tex
	pdflatex $^

solicitud_de_inscripcion_%-${ANIO}.pdf: solicitud_de_inscripcion_%-${ANIO}.doc
	libreoffice --convert-to pdf $<
