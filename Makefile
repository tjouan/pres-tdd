BUILD_DIR	?= build
SRC_DIR		?= src
OUTPUT_DIR	?= output
TEX_FILE	?= main.latex
PDF_FILE	?= ${BUILD_DIR}/${TEX_FILE:.latex=.pdf}
TEX		?= xelatex
VIEWER		?= xpdf -fullscreen

all: ${PDF_FILE}
preview: clean install view

${PDF_FILE}: ${SRC_DIR}/${TEX_FILE}
	${TEX} -output-directory ${BUILD_DIR} ${SRC_DIR}/${TEX_FILE}
	${TEX} -output-directory ${BUILD_DIR} ${SRC_DIR}/${TEX_FILE}

install: ${PDF_FILE}
	cp ${PDF_FILE} ${OUTPUT_DIR}

view: ${PDF_FILE} install
	${VIEWER} ${PDF_FILE} > /dev/null 2>&1

clean:
	@find ${BUILD_DIR} -type f -delete
