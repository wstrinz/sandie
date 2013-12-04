# coding: utf-8

Gem::Specification.new do |spec|
  spec.name = 'sandie'
  spec.version = '0.0.0'
  spec.author = 'Rafal Chmiel'
  spec.email = 'rafalmarekchmiel@gmail.com'
  spec.description = 'Sandie is a straightforward API wrapper for the eval.so sandboxed code execution platform API.'
  spec.summary = 'Sandie is a straightforward API wrapper for eval.so.'
  spec.homepage = 'https://github.com/rafalchmiel/sandie'
  spec.license = 'MIT'

  spec.files = `git ls-files`.split($/)
  spec.test_files = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
end
