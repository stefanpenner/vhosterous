begin
  # Try to require the preresolved locked set of gems.
  require File.expand_path('../.bundle/environment', __FILE__)
rescue LoadError
  # Fall back on doing an unlocked resolve at runtime.
  require "rubygems"
  require "bundler"
  Bundler.setup
end

Bundler.require

$:.unshift Pathname.new(__FILE__).dirname.join('..', 'lib')

require File.expand_path('../app',__FILE__)

Vhosterous::App.initialize!

require 'pathname'
require 'vhosterous'
