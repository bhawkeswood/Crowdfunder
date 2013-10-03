class SessionsController < ApplicationController
  def new
  end

  def create
  	user = login(params[:email], params[:password])
  		if user
  			redirect_back_or_to root_url, :notice => "Logged in as #{user.first_name}!"
  		else
  			flash.now.alert = "Email or Password was Invalid"
  			render :new
  		end
  end

  def destroy
  	logout
  	redirect_to root_url, :notice => "Logged out!  Bye bye!"
  end
end
