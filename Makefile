OUTPUT = _build
AD = asciidoctor
WP = weasyprint

default: all

all: clean html pdf epub kindle docbook

html:
	${AD} --backend=html5 \
		-a max-width=55em \
		--destination-dir=${OUTPUT} \
		--out-file=book.html main.adoc

pdf:
	${AD} --backend=html5 \
		-a max-width=55em \
		--destination-dir=${OUTPUT} \
		--out-file=book.html main.adoc
	${WP} ${OUTPUT}/book.html ${OUTPUT}/book.pdf

pdf-native:
	${AD} --backend=pdf --require=asciidoctor-pdf \
		-a allow-uri-read \
		--destination-dir=${OUTPUT} \
		--out-file=book.pdf main.adoc

epub:
	${AD} --backend=epub3 --require=asciidoctor-epub3 \
		--destination-dir=${OUTPUT} \
		--out-file=book.epub main.adoc

kindle:
	${AD} --backend=epub3 --require=asciidoctor-epub3 \
		-a ebook-format=kf8 \
		--destination-dir=${OUTPUT} \
		--out-file=book.mobi main.adoc
	if [ -e "${OUTPUT}/book.mobi" ]; \
		then rm ${OUTPUT}/book-kf8.epub; \
	fi;

docbook:
	${AD} --backend=docbook \
		--destination-dir=${OUTPUT} \
		--out-file=book.xml main.adoc

clean:
	rm -rf _build/*.{pdf,epub,mobi,xml}

.PHONY: all pdf pdf-native epub kindle docbook clean
