# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'zest_worker/version'

Gem::Specification.new do |spec|
  spec.name          = "zest_worker"
  spec.version       = ZestWorker::VERSION
  spec.authors       = ["Rafia Qutab"]
  spec.email         = ["rq@zestfinance.com"]
  spec.description   = %q{example for resque worker}
  spec.summary       = %q{create a resque worker to run gverify jobs}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "pry"

  spec.add_dependency "resque"
end
