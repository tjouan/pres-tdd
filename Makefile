TEX_FILE	?= main.latex
PDF_FILE	?= ${TEX_FILE:.latex=.pdf}
XELATEX		?= xelatex
VIEWER		?= xpdf -fullscreen

all: pdf
pdf: ${PDF_FILE}
v: fclean preview

${PDF_FILE}:
	@${XELATEX} ${TEX_FILE}

preview: ${PDF_FILE}
	${VIEWER} ${PDF_FILE}

clean:
	@find . -name \*.aux -delete
	@find . -name \*.log -delete
	@find . -name \*.nav -delete
	@find . -name \*.out -delete
	@find . -name \*.snm -delete
	@find . -name \*.toc -delete

fclean: clean
	@rm -f ${PDF_FILE}
