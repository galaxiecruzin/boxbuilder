## SCAD Compiler
SCAD?=/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD
SRC_DIR=src
STL_DIR=build
SOURCES=$(wildcard $(SRC_DIR)/*.scad)
TARGETS=$(patsubst $(SRC_DIR)/%.scad, $(STL_DIR)/%.stl, $(SOURCES))

all: stls

stls: $(TARGETS)

$(STL_DIR)/%.stl: $(SRC_DIR)/%.scad
	$(SCAD) -m make -o $@ $<

clean:
	rm -f ./build/*.stl

