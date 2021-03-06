# -*- encoding: utf-8 -*-
VERSION = "1.1"

Gem::Specification.new do |spec|
  spec.name          = "motion-list"
  spec.version       = VERSION
  spec.authors       = ["Watson"]
  spec.email         = ["watson1978@gmail.com"]
  spec.description   = %q{This is RubyMotion plugin which provides various lists.}
  spec.summary       = %q{This is RubyMotion plugin which provides various lists.}
  spec.homepage      = "https://github.com/Watson1978/motion-list"
  spec.license       = "MIT"
  spec.extensions    = ['ext/extconf.rb'] # Command-Line Plugin Installer

  files = []
  files << 'README.md'
  files.concat(Dir.glob('ext/**/*'))
  files.concat(Dir.glob('command/**/*.rb'))
  spec.files         = files
  spec.require_paths = ["lib"]
end
