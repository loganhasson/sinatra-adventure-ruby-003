class ApplicationController < Sinatra::Base
  Sinatra::RatPack.configure do |config|
    config.root = "http://localhost:9292"
    config.enable_auto_views = true
  end
  # RatPack::Configure.set_root("http://localhost:9292")
  # RatPack::Configure.enable_implicit_views

  configure :development do
    register Sinatra::Reloader
  end

end
