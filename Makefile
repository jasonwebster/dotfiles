EXCLUDES := . .. .git Makefile
SOURCES := $(filter-out $(EXCLUDES), $(shell \ls -a .))

HOMEBREW_FORMULAE := git ripgrep fzf asdf ruby-build hub jq
APT_PACKAGES := ripgrep fzf hub

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

install-formulae: install-homebrew
	brew install $(HOMEBREW_FORMULAE)

install-apt-packages:
	apt-get install -y $(APT_PACKAGES)
