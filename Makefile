EXCLUDES := . .. .git Makefile
SOURCES := $(filter-out $(EXCLUDES), $(shell \ls -a .))

FORMULAE := bash-completion git ruby-build hub

install:
	cp -Rfv ${SOURCES} ${HOME}
	cp -Rfv bin ${HOME}

install-homebrew:
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

install-rbenv:
	git clone git@github.com:rbenv/rbenv.git ~/.rbenv
	cd ~/.rbenv && src/configure && make -C src

install-nvm:
	git clone git@github.com:creationix/nvm.git ~/.nvm && cd ~/.nvm && git checkout `git describe --abbrev=0 --tags`

install-formulae:
	brew install $(FORMULAE)
# link up homebrew bash completion
	ln -s "/usr/local/Library/Contributions/brew_bash_completion.sh" "/usr/local/etc/bash_completion.d"
