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
task :install => [ 'install:deps', 'install:copy', 'install:post' ]

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

  desc 'Run post-install tasks.'
  task :post do
    puts "\n\n\n##################################################"
    puts "Don't forget to edit your git config: ~/.gitconfig"
  end

end
