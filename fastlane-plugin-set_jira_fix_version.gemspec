# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fastlane/plugin/set_jira_fix_version/version'

Gem::Specification.new do |spec|
  spec.name          = 'fastlane-plugin-set_jira_fix_version'
  spec.version       = Fastlane::SetJiraFixVersion::VERSION
  spec.author        = %q{yuriy-tolstoguzov}
  spec.email         = %q{Yuriy.Tolstoguzov@gmail.com}

  spec.summary       = %q{Adds fix version to specified JIRA issues. Creates version if needed}
  spec.homepage      = "https://github.com/yuriy-tolstoguzov/fastlane-plugin-set_jira_fix_version"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*"] + %w(README.md LICENSE)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'jira-ruby', '~> 1.2.0'

  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'fastlane', '>= 2.20.0'
end
