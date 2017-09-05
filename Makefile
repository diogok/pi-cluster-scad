.PHONY: clean

openscad = $$(type openscad-nightly > /dev/null 2>&1 && echo "openscad-nightly" || echo "openscad")

all: stl/base.stl

clean:
	rm stl/* -Rf

stl/base.stl:
	$(openscad) -o stl/base.stl src/base.scad

