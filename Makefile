BREW := /usr/local/bin/brew
CHILD_MAKEFILES_DIRS = $(sort $(dir $(wildcard Packages/*/Makefile)))
PACKAGE_SOURCES_DIRS = $(sort $(dir $(wildcard Packages/*/Sources/**)))

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
	mint run swiftlint --path example
	@for d in $(PACKAGE_SOURCES_DIRS); do ( mint run swiftlint --path $$d; ); done

## swiftgen: Trigger code generation from assets with swiftgen tool
swiftgen: swiftgen_packages
	mint run swiftgen

.PHONY:
swiftgen_packages: $(CHILD_MAKEFILES_DIRS)
	@for d in $(CHILD_MAKEFILES_DIRS); do ( cd $$d && ln -s ../../Mintfile Mintfile && $(MAKE) && rm -fr Mintfile; ); done

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
