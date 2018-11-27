class ConnectController < ApplicationController
  def show
    
  end

  def create
    email = params[:email]
    name = params[:name]
    subscription = SubscribeToNewsletterService.new(email, name)

  	if subscription.call
  	  flash[:notice] = "Your message has been sent! We will get back to you shortly!"
      # raise
      redirect_to connect_path
    else
      flash[:alert] = "Please fill out required fields!"
      redirect_to connect_path
    end
  end
end
