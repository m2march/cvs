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
