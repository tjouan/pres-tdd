TEX_FILE	?= main.latex
PDF_FILE	?= ${TEX_FILE:.latex=.pdf}
XELATEX		?= xelatex
VIEWER		?= xpdf

all: pdf
pdf: ${PDF_FILE}
v: cleanall preview

$(PDF_FILE):
	@$(XELATEX) $(TEX_FILE)

preview: $(PDF_FILE)
	${VIEWER} ${PDF_FILE}

clean:
	@find . -name \*.aux -delete
	@find . -name \*.log -delete

fclean:
	@rm -f ${PDF_FILE}
