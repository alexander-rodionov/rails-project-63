.PHONY: build test install

install:
	bundle install

build:
	bundler exec rake build

test: 
	bundler exec rake test

lint:
	bundler exec rubocop

all: install lint build test