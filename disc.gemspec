# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'disc/version'

Gem::Specification.new do |spec|
  spec.name          = "disc"
  spec.version       = Disc::VERSION
  spec.authors       = ["Patrick Schmitz"]
  spec.email         = ["pat@reccenter.com"]
  spec.summary       = %q{An Object wrapper for the Discourse Forum Api.}
  spec.description   = %q{Use the Discourse Client Gem and wrap JSON with objects.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "discourse_api"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "awesome_print"
end
