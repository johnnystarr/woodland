APP = woodland

DEFAULT_GOAL: local

clean:
	@echo Ok.
	@rm -rf build dist
	@rm -f src/tags

local: clean
	@mkdir -p build
	cd build; cmake ..; make

tags: 
	cd src; ctags --c++-kinds=+cdefgmnpstuv --fields=+iaS --extra=+q *.h *.c

run: local tags
	./build/woodland

docker:
	@docker build -t $(APP) .
	@docker run -it --rm $(APP):latest

dist: local
	@mkdir -p dist
	@tar cfz ./dist/woodland.tar.gz README.md ./build/woodland
