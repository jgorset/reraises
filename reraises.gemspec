# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'reraises/version'

Gem::Specification.new do |spec|
  spec.name          = "reraises"
  spec.version       = Reraises::VERSION
  spec.authors       = ["Johannes Gorset"]
  spec.email         = ["jgorset@gmail.com"]
  spec.description   = "Reraise an exception as another"
  spec.summary       = "Reraise an exception as another"
  spec.homepage      = "https://github.com/jgorset/reraises"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
