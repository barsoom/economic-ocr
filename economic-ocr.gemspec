# -*- encoding: utf-8 -*-
require File.expand_path('../lib/economic-ocr/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Barsoom"]
  gem.email         = ["albert@barsoom.se"]
  gem.summary       = "Generates OCR numbers with an extra e-conomic flavor"
  gem.homepage      = "https://github.com/barsoom/economic-ocr"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "economic-ocr"
  gem.require_paths = ["lib"]
  gem.version       = Economic::Ocr::VERSION
  # For Travis CI.
  gem.add_development_dependency "rake"
  #
  if RUBY_VERSION < "1.9.3"
    gem.add_development_dependency "minitest"
  end
end
