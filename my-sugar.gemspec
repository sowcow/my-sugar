# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'my-sugar/version'

Gem::Specification.new do |gem|
  gem.name          = "my-sugar"
  gem.version       = MySugar::VERSION
  gem.authors       = ["Alexander K"]
  gem.email         = ["xpyro@ya.ru"]
  gem.description   = %q{my sweet box of syntactic stuff}
  gem.summary       = %q{my sweet box of syntactic stuff}
  gem.homepage      = "https://github.com/sowcow/my-sugar"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  # gem.add_dependency 'active_support' # not using forwardable

  gem.add_development_dependency 'rspec'  
end