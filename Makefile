APP = woodland

DEFAULT_GOAL: local

clean:
	@echo Ok.
	@rm -rf build
	@rm -f src/tags

local: clean
	@mkdir -p build
	cd build; cmake ..; make
	cd src; ctags --c++-kinds=+cdefgmnpstuv --fields=+iaS --extra=+q *.h *.c

docker:
	@docker build -t $(APP) .
	@docker run -it --rm $(APP):latest
