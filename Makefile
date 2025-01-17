.PHONY: build test install

install:
	bundle install

build: install
	rake build

test: 
	rake test