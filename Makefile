BREW := /usr/local/bin/brew

all: bootstrap

## bootstrap: Bootstrap project dependencies for development
bootstrap: homebrew
	mint bootstrap

## project: Generate .xcodeproj file using XcodeGen utility
project:
	mint run "yonaskolb/XcodeGen"

## gems: Install ruby dependencies
gems:
	bundle install

## homebrew: Bootstrap Homebrew dependencies
homebrew: $(BREW)
	brew bundle check || brew bundle

## fmt: Launch swift files code formatter
fmt:
	mint run swiftformat swiftformat example exampleTests

## lint: Launch swift files linter check
lint:
	mint run swiftlint

## swiftgen: Trigger code generation from assets with swiftgen tool
swiftgen:
	mint run swiftgen

## clean: Clean up project files
clean:
	git clean -Xfd

## help: Prints help message
help:
	@echo "Usage: \n"
	@sed -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':' |  sed -e 's/^/ /' | sort

$(BREW):
	curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install | ruby

.PHONY: all help bootstrap test gems certs lint fmt homebrew swiftlint icon project clean hook
