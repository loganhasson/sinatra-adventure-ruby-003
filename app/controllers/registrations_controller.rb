class RegistrationsController < ApplicationController
  enable :sessions

  get '/register' do
    erb :register
  end

  post '/register' do
    session[:email] = params[:email]
    session[:password] = params[:password]
    redirect '/new'
  end

  get '/new' do
    if !user_registered?
      redirect to '/register'
    else
      erb :new_user
    end
  end

  def user_registered?
    if session[:email] == "" && session[:password] == ""
      session[:error_type] = "Really? You're not even trying, are you? Enter <em>something</em> at least."
    elsif session[:email] == ""
      session[:error_type] = "You didn't enter an email address!"
    elsif session[:password] == ""
      session[:error_type] = "You didn't enter a password!"
    end
    
    session[:email] != "" && session[:password] != ""
  end

end