.PHONY: build test install

install:
	bundle install

build:
	rake build

test: 
	rake test

lint:
	rubocop