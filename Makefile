EXCLUDES := . .. .git Makefile
SOURCES := $(filter-out $(EXCLUDES), $(shell \ls -a .))

FORMULAE := bash-completion git ruby-build hub

install:
	cp -Rfv ${SOURCES} ${HOME}

install-homebrew:
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

install-formulae:
	brew install $(FORMULAE)
# link up homebrew bash completion
	ln -s "/usr/local/Library/Contributions/brew_bash_completion.sh" "/usr/local/etc/bash_completion.d"


