ANIO=2020

all: martin-miguel-JTP.pdf martin-miguel-AY1.pdf martin-miguel-JTP_e.pdf

martin-miguel-%.pdf: solicitud_de_inscripcion_%-${ANIO}.pdf cv.pdf
	pdftk $^ cat output $@

cv.pdf: cv.tex
	pdflatex $^

