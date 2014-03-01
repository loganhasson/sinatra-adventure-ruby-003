class RootController < ApplicationController
  
  get '/' do
    session.clear
  end

end
