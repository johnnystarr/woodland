
DEFAULT_GOAL: build

build:
	@mkdir -p build
	cd build; cmake ..; make; ./woodland

clean:
	@rm -rf build

