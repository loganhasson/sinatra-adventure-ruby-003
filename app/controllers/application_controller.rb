class ApplicationController < Sinatra::Base
  RatPack::Configure.enable_implicit_views

  configure :development do
    register Sinatra::Reloader
  end

end
