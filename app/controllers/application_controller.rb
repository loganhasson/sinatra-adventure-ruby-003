class ApplicationController < Sinatra::Base
  RatPack::Configure.set_root("http://localhost:9292")
  RatPack::Configure.enable_implicit_views

  configure :development do
    register Sinatra::Reloader
  end

end
