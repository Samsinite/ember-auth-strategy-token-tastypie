# -*- encoding: utf-8 -*-
require 'json'

package = JSON.parse(File.read('package.json'))

Gem::Specification.new do |gem|
  gem.name        = 'ember-auth-strategy-token-tastypie-source'
  gem.version     = package['version']
  gem.authors     = ['Samuel Clopton']
  gem.email       = ['samsinite@gmail.com']
  gem.date        = Time.now.strftime('%Y-%m-%d')
  gem.summary     = 'Ember-auth tastypie token strategy adapter source code wrapper'
  gem.description = 'Ember-auth tastypie token strategy adapter source code wrapper for ruby libs.'
  gem.homepage    = 'https://github.com/Samsinite/ember-auth-strategy-token-tastypie'

  gem.files       = ['dist/ember-auth-strategy-token-tastypie.js',
                     'lib/ember/auth/strategy/token/source.rb']

  gem.add_dependency 'ember-source',      '~> 1.0'
  gem.add_dependency 'ember-auth-source', '~> 9.0'

  gem.license     = 'MIT'
end
