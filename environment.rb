require 'bundler'

Bundler.require

Dir[File.join(File.dirname(__FILE__), "./app/helpers", "*.rb")].each {|f| require f}
Dir[File.join(File.dirname(__FILE__), "./app/controllers", "*.rb")].each {|f| require f}
