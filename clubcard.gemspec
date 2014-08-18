# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'clubcard/version'

Gem::Specification.new do |spec|
  spec.name          = "clubcard"
  spec.version       = Clubcard::VERSION
  spec.authors       = ["Muz"]
  spec.email         = ["muz@blinkbox.com"]
  spec.summary       = %q{A ruby gem for generating and handling Clubcards}
  spec.description   = %q{A ruby gem that can generate, and model Clubcards}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
