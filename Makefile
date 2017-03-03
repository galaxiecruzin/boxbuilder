## SCAD Compiler
SCAD?=/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD
SRC_DIR=src
STL_DIR=build
SOURCES=$(wildcard $(SRC_DIR)/*.scad)
TARGETS=$(patsubst $(SRC_DIR)/%.scad, $(STL_DIR)/%.stl, $(SOURCES))

#all: stls
#stls: $(TARGETS)
#
#$(STL_DIR)/%.stl: $(SRC_DIR)/%.scad
#	$(SCAD) -m make -o $@ $<

all:
	$(SCAD) -m make -D 'part="1"' -o build/case.stl src/thingiverse-boxbuilder.scad
	$(SCAD) -m make -D 'part="2"' -o build/fr-plate.stl src/thingiverse-boxbuilder.scad
	$(SCAD) -m make -D 'part="3"' -o build/both.stl src/thingiverse-boxbuilder.scad

clean:
	rm -f ./build/*.stl
