# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'generic_web_hook/version'

Gem::Specification.new do |spec|
  spec.name          = 'generic_web_hook'
  spec.version       = GenericWebHook::VERSION
  spec.authors       = ['Laurent B.']
  spec.email         = ['lbnetid+gh@gmail.com']
  spec.summary       = %q{Generic Web Hook.}
  spec.description   = %q{Intend to be a generic implementation for Web Hooks to be used among other with CI systems.}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '~> 3.1'
  spec.add_development_dependency 'rack-test'
  spec.add_development_dependency 'pry'

  spec.add_dependency 'easy_app_helper', '~> 2.0'
  spec.add_dependency 'sinatra'
  spec.add_dependency 'sinatra-contrib'
  spec.add_dependency 'thin'
  spec.add_dependency 'activesupport'
  spec.add_dependency 'rack-mount'

end
