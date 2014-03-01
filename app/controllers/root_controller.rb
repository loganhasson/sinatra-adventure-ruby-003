class RootController < ApplicationController
  
  get '/' do
    session.clear
    erb :index
  end

end
