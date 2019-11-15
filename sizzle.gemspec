
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "sizzle/version"

Gem::Specification.new do |spec|
  spec.name          = "sizzle"
  spec.version       = Sizzle::VERSION
  spec.authors       = ["Kyle Decot"]
  spec.email         = ["kyle@joinroot.com"]

  spec.summary       = "Tool for interacting w/ App Store Connect & Google Play Store"
  spec.description   = "Tool for interacting w/ App Store Connect & Google Play Store"
  spec.homepage      = "https://github.com/kyledecot/sizzle"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]


  spec.add_dependency "gli"
  spec.add_dependency "colorize"
  spec.add_dependency "app_store_connect"
  spec.add_dependency "terminal-table"

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
end
