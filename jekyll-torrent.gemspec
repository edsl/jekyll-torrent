# encoding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jekyll-torrent/version'

Gem::Specification.new do |gem|
  gem.name          = "jekyll-torrent"
  gem.version       = JekyllTorrent::VERSION
  gem.authors       = ["Mauricio Pasquier Juan"]
  gem.email         = ["mauricio@pasquierjuan.com.ar"]
  gem.description   = %q{A simple plugin that creates a .torrent file with your
                      whole site after it's generated by jekyll. It
                      monkeypatches `Jekyll::Site.process`.}
  gem.summary       = %q{Create a .torrent file with your whole site!}
  gem.homepage      = "https://github.com/mauriciopasquier/jekyll-torrent"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency('jekyll')
end