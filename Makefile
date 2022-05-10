EXCLUDES := . .. .git Makefile
SOURCES := $(filter-out $(EXCLUDES), $(shell \ls -a .))

HOMEBREW_FORMULAE := git ripgrep fzf asdf ruby-build hub jq
APT_PACKAGES := ripgrep fzf hub

install:
	cp -Rfv ${SOURCES} ${HOME}
	cp -Rfv bin ${HOME}

install-homebrew:
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

install-asdf:
	asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
	asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
	asdf plugin-add deno https://github.com/asdf-community/asdf-deno.git

install-formulae: install-homebrew
	brew install $(HOMEBREW_FORMULAE)

install-apt-packages:
	apt-get install -y $(APT_PACKAGES)
