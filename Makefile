.PHONY: examples

CC = xelatex

RESUME_BASE_DIR = resume
RESUME_CONTENTS_DIR = resume/contents
RESUME_SRCS = $(shell find $(RESUME_CONTENTS_DIR) -name '*.tex')

OUTPUT_DIR = output

build: $(foreach x, coverletter cv resume, $x.pdf)

docker-resume:
	docker run --rm -v $(shell pwd):/data vipintm/xelatex make resume.pdf

resume.pdf: $(RESUME_BASE_DIR)/resume.tex $(RESUME_SRCS)
	$(CC) -output-directory=$(OUTPUT_DIR) $<

clean:
	rm -rf $(OUTPUT_DIR)/*.pdf
