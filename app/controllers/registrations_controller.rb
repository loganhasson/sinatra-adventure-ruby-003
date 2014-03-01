class RegistrationsController < ApplicationController
  enable :sessions

  get '/registrations/new' do
  end

  get '/registrations/:email' do
    # if !user_registered?
    #   redirect to '/registrations/new'
    # end
  end

  post '/register' do
    session[:email] = params[:email]
    session[:password] = params[:password]
    redirect to "/registrations/#{session[:email]}"
  end


  def user_registered?
    if email_blank? && password_blank?
      session[:error_type] = "Really? You're not even trying, are you? Enter <em>something</em> at least."
    elsif email_blank?
      session[:error_type] = "You didn't enter an email address!"
    elsif password_blank?
      session[:error_type] = "You didn't enter a password!"
    end
    
    !(email_blank? && password_blank?)
  end

  def email_blank?
    session[:email] == nil || session[:email] == ""
  end

  def password_blank?
    session[:password] == nil || session[:password] == ""
  end

end