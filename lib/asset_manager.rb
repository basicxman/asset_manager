module AssetManager
  VERSION = "0.1.0"

  FETCHERS = [:git]
  require 'asset_manager/fetch/git'
  require 'asset_manager/manager'
  require 'asset_manager/runner'
end
