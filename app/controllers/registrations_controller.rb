class RegistrationsController < ApplicationController

  get '/register' do
    erb :register
  end

  # Registration!
  # You'll need a way to send the registration form here.
  # Use your battle-hardened text editor to create the
  # appropriate route, look at the request, and then
  # direct them to the new user page via the route above.
  #
  # Create a route that handles a POST HTTP request from the
  # registration form, then see what /new has to say.


  get '/new' do
    # You will need to send properly registered people to me
    # and render a template that will tell them they
    # have completed their quest

    # keep this line of code in place to protect this sacred
    # page from interlopers who have not properly completed
    # the maze you are constructing. You will need to implement
    # the code to allow them to pass this challenge when
    # they have registered
    throw Unauthorized unless user_registered?
    # Bonus experience! This makes an ugly error page happen.
    # Can you check for this same condition, but send them back to
    # the registration page with an error message that will tell
    # them what they've done wrong?
  end

  end
