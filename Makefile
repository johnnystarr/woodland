
DEFAULT_GOAL: build

clean:
	@echo Ok.
	@rm -rf build

build: clean
	@mkdir -p build
	cd build; cmake ..; make; ./woodland
