class LandingController < ApplicationController
  def show

  end

  def create
  	# gibbon = Gibbon::Request.new(api_key: "3dd3dba831f1bbf578302e564475c0b2-us17")
  	# mailchimp = Mailchimp::API.new("3dd3dba831f1bbf578302e564475c0b2-us17")
  	email = params[:email]
  	raise

  	if mailchimp.lists.subscribe(MAILCHIMP-LIST-ID, { "email" => email, "euid" => "123", "leid" => "123123" })
  	  flash[:notice] = "Your message has been sent! We will get back to you shortly!"
      # raise
      redirect_to root_path
    else
      flash[:alert] = "Please fill out required fields!"
      redirect_to root_path
    end
  end
end
