class HelloController < ApplicationController

  get '/xyzzy' do
    erb :hello
  end

end
