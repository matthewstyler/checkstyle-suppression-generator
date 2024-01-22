# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name          = 'checkstyle-suppression-generator'
  s.version       = '0.0.2'
  s.summary       = 'Generate a Java checkstyle suppressions.xml file from a checkstyle:check output.'
  s.description   = 'A gem that takes as input the output of a maven checkstyle plugin checkstyle:check goal and
                    generates a suppressions.xml file'
  s.authors       = ['Tyler Matthews (matthewstyler)']
  s.email         = 'matthews.tyl@gmail.com'
  s.files         = `git ls-files bin lib *.md LICENSE`.split("\n")
  s.license       = 'MIT'
  s.executables   = ['checkstyle-suppression-generator']
  s.require_paths = ['lib']

  s.required_ruby_version       = '>= 2.7.0'

  s.homepage                    = 'https://github.com/matthewstyler/checkstyle-suppression-generator'
  s.metadata['source_code_uri'] = 'https://github.com/matthewstyler/checkstyle-suppression-generator'
  s.metadata['bug_tracker_uri'] = 'https://github.com/matthewstyler/checkstyle-suppression-generator/issues'

  s.add_dependency 'tty-option', '~> 0.3.0'

  s.add_development_dependency 'minitest', '~> 5.18'
  s.add_development_dependency 'mocha', '~> 2.1.0'
  s.add_development_dependency 'pry-byebug', '~> 3.10.1'
  s.add_development_dependency 'rake', '~> 13.1.0'
  s.add_development_dependency 'rubocop', '~> 1.60.1'
  s.add_development_dependency 'simplecov', '~> 0.22.0'
end
