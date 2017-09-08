.PHONY: clean

openscad = $$(type openscad-nightly > /dev/null 2>&1 && echo "openscad-nightly" || echo "openscad")

objects=big single connector

clean:
	rm stl/* -Rf

all: $(objects)

$(objects):
	$(openscad) -o stl/$@.stl src/$@.scad ;\


