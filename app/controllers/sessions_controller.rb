class SessionsController < ApplicationController

  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)

  	if user && user.authenticate(params[:session][:password])
  		# sign in the user and redirect to user profile (show form).
  		sign_in user
  		redirect_to user
  	else
  		# Create error message and rerender signin form.
  		flash.now[:error] = 'Invalid email/password combination'
  		render 'new'
  	end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
  
end