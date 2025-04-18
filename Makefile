##
# Eask generated template Makefile
#
# File located in https://github.com/emacs-eask/template-elisp/blob/master/Makefile
##

EMACS ?= emacs
EASK ?= eask

.PHONY: ci clean package install compile test checkdoc lint test_all

ci: clean package install compile checkdoc lint test

package:
	@echo "Packaging..."
	$(EASK) package

install:
	@echo "Installing..."
	$(EASK) install

compile:
	@echo "Compiling..."
	$(EASK) compile

test:
	@echo "Testing..."
	# $(EASK) install-deps --dev
	$(EASK) test ert ./tests/*.el

checkdoc:
	@echo "Checking documentation..."
	$(EASK) lint checkdoc --strict

lint:
	@echo "Linting..."
	$(EASK) lint package

test_all:
	@echo "Testing across all Emacs versions..."
	(cd tests && ./run-tests.bash)

cross_install:
	@echo "Cross installing in .emacs.d/elpa..."
	$(EASK) install
	$(EASK) run command install-in-emacs-local-config

clean:
	$(EASK) clean all
