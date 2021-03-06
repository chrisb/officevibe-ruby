
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "officevibe/version"

Gem::Specification.new do |spec|
  spec.name          = "officevibe"
  spec.version       = Officevibe::VERSION
  spec.authors       = ["Chris Bielinski"]
  spec.email         = ["chrisb@users.noreply.github.com"]

  spec.summary       = "An Officevibe client for Ruby"
  spec.description   = "An Officevibe client for Ruby. Currently supports only a few things."
  spec.homepage      = "https://github.com/chrisb/officevibe-ruby"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday_middleware", "~> 0.13.1"
  spec.add_dependency "json", "~> 2.2.0"
  spec.add_dependency "activesupport", "~> 5.2"

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry", "~> 0.12.2"
  spec.add_development_dependency "awesome_print", "~> 1.8.0"
end
