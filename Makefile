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

validate-cut:
	@echo "Are you sure you want to cut a new release? [y,n]"
	@read answer

cut-major:
	@./.cut.sh major

cut-minor:
	@./.cut.sh minor

cut-patch: validate-cut
	@./.cut.sh patch

