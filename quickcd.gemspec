# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'quickcd/version'

Gem::Specification.new do |spec|
  spec.name          = "quickcd"
  spec.version       = Quickcd::VERSION
  spec.authors       = ["Rudi Luzar"]
  spec.email         = ["rudi@rudicode.com"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  end

  spec.summary       = %q{quickly change to presaved directories on the command line}
  spec.description   = %q{quickly change to presaved directories on the command line}
  spec.homepage      = "https://github.com/rudicode/quickcd"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  # spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.executables   = "quickcd"
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
end
