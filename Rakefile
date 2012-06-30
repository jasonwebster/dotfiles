require 'fileutils'

# Files
def entries
  @files ||= Dir.entries( File.expand_path( '~/.dotfiles' ) ) - $exclude
end

# Files and folders which shouldn't be copied over
$exclude = [
  '.',
  '..',
  '.git',
  '.gitignore',
  'Gemfile',
  'Gemfile.lock',
  'Rakefile',
  'README.md'
]

desc 'Backup previous dotfiles.'
task :backup do
  dir = File.expand_path File.join( '~' , '.dotfiles-backup', Time.now.to_i.to_s )
  FileUtils.mkdir_p dir
  entries.each do | file |
    orig = File.expand_path "~/#{file}"
    FileUtils.cp_r orig, "#{dir}/#{file}", :verbose => true if File.exists? orig
  end
end

desc 'Update dotfiles repository.'
task :update do
  system 'git pull'
end

desc 'Run all install tasks in order.'
task :install => %w(install:deps install:copy install:post)

namespace :install do

  desc 'Check for and install required dependencies.'
  task :deps do
    # Homebrew
    puts 'Please install homebrew' and exit 1 unless system 'which brew'

    # Bundler
    puts 'Please install bundler' and exit 1 unless system 'which bundle'
    system 'bundle install'
  end

  desc 'Copy dotfiles over to home dir.'
  task :copy do
    entries.each do | file |
      FileUtils.cp_r file, File.expand_path( "~/#{file}" ), :verbose => true, :remove_destination => true
    end
  end

  desc 'Install required brew formulae'
  task :formulae do
    %w(bash-completion git ruby-build node).each do |f|
      system "brew install #{f}"
    end

    # link up homebrew bash completion
    system 'ln -s "/usr/local/Library/Contributions/brew_bash_completion.sh" "/usr/local/etc/bash_completion.d"'
  end

  desc 'Install required npm packages'
  task :npm do
    unless system 'which npm'
      system 'curl http://npmjs.org/install.sh | sh'
    end

    %w(n coffee-script stylus).each do |f|
      system "npm install -g #{f}"
    end
  end

	desc 'Install ruby'
  task :ruby do
    puts 'Installing ruby 1.9.3-p125 via rbenv install'
    system 'rbenv install 1.9.3-p125'
    system 'rbenv global 1.9.3-p125'
	end

  desc 'Run post-install tasks.'
  task :post do
		puts "Linking ST2 packages"
		FileUtils.ln_s File.expand_path("~/.sublime_packages"), File.expand_path("~/Library/Application Support/Sublime Text 2/Packages"), :force => true

    puts "\n\n\n##################################################"
    puts "Don't forget to edit your git config: ~/.gitconfig"
  end

end
