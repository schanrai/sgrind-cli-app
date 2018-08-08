
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "sgrind/version"

Gem::Specification.new do |spec|
  spec.name          = "sgrind"
  spec.version       = Sgrind::VERSION
  spec.authors       = ["'Sushi Chanrai'"]
  spec.email         = ["'sushi@pathworks.co'"]

  spec.summary       = %q{Sgrind CLI app helps users find events on the Startup Grind website}
  spec.description   = %q{The Sgrind CLI app facilitates easy retrieval of event data about Startup Grind future events.}
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org/'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = "sgrind"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'pry', '~> 0.9.12.2'
  spec.add_dependency 'nokogiri','~>1.6'

end
