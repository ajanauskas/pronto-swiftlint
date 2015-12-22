# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pronto/swiftlint/version'

Gem::Specification.new do |spec|
  spec.name          = 'pronto-swiftlint'
  spec.version       = Pronto::Swiftlint::VERSION
  spec.authors       = ['Andrius Janauskas']
  spec.email         = ['andrius.janauskas@gmail.com']

  spec.summary       = 'Pronto runner for SwiftLint'
  spec.description   = <<-EOF
    A pronto runner for SwiftLint - Swift code analyzer. Pronto runs analysis quickly by checking only
    the relevant changes. Created to be used on pull requests, but suited for other scenarios as well.
  EOF
  spec.homepage      = 'https://github.com/ajanauskas/pronto-swiftlint'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.3'

  spec.add_runtime_dependency 'pronto', '~> 0.5.0'
end
