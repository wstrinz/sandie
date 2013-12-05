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
  spec.add_development_dependency 'rake', '~> 10.1'
  spec.add_development_dependency 'rspec', '~> 2.14'
  spec.add_development_dependency 'guard-rspec', '~> 4.2'
  spec.add_development_dependency 'simplecov', '~> 0.8'
  spec.add_development_dependency 'coveralls', '~> 0.7'
  spec.add_development_dependency 'yard', '~> 0.8'

  spec.add_runtime_dependency 'httparty', '~> 0.12'
end
