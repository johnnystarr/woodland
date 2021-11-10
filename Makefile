
DEFAULT_GOAL: build

clean:
	@echo Ok.
	@rm -rf build
	@rm -f src/tags

build: clean
	@mkdir -p build
	cd build; cmake ..; make; ./woodland
	cd src; ctags --c++-kinds=+cdefgmnpstuv --fields=+iaS --extra=+q *.h *.c
