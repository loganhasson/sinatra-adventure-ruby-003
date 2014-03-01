class HelloController < ApplicationController

  # after do
  #   binding.pry
  #   if response.body.empty?
  #     body erb :muahaha
  #   end
  # end

  get '/xyzzy' do
    erb :hello
  end

end
