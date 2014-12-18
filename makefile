TEX = pdflatex -shell-escape
LatexFile = diff_geometry_notes
#FIND ALL FILES IN SUBDIRECTORIES WITH NUMERIC NAMES
DEPS = $(shell find . -regex "\./[0-9]+/class.tex") general.sty

#.PHONY : all 
	
all: $(LatexFile).pdf 

$(LatexFile).pdf: $(LatexFile).tex $(DEPS)
	while ($(TEX) $(LatexFile).tex ; \
	grep -q "Rerun to get cross" $(LatexFile).log ) do true; \
	done

