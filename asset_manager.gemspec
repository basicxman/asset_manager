$:.push File.expand_path("../lib", __FILE__)
require 'asset_manager'

Gem::Specification.new do |s|
  s.name        = "asset_manager"
  s.version     = AssetManager::VERSION
  s.authors     = ["Andrew Horsman"]
  s.email       = ["self@andrewhorsman.net"]
  s.homepage    = "http://github.con/basicxman/asset_manager"
  s.summary     = "Quick Gemfile-like tool for managing assets."
  s.description = "Tool to manage static assets like JS, CSS and images."

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
