TEX = pdflatex -shell-escape
LatexFile = diff_geometry_notes
Definitions = list_definitions
Summary = summary_outline
#FIND ALL FILES IN SUBDIRECTORIES WITH NUMERIC NAMES
DEPS = $(shell find . -regex "\./[0-9]+/class.tex") general.sty

#.PHONY : all 
	
all: $(LatexFile).pdf $(Definitions).pdf $(Summary).pdf

$(LatexFile).pdf: $(LatexFile).tex $(DEPS)
	while ($(TEX) $(LatexFile).tex ; \
	grep -q "Rerun to get cross" $(LatexFile).log ) do true; \
	done

$(Definitions).pdf: $(Definitions).tex $(DEPS)
	while ($(TEX) $(Definitions).tex ; \
	grep -q "Rerun to get cross" $(Definitions).log ) do true; \
	done

$(Summary).pdf: $(Summary).tex $(DEPS)
	while ($(TEX) $(Summary).tex ; \
	grep -q "Rerun to get cross" $(Summary).log ) do true; \
	done

$(Summary).tex:
	./summarize.sh $(Summary).tex
