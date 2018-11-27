class ConnectController < ApplicationController
  def show
    @gibbon = Gibbon::Request.new(api_key: ENV['MAILCHIMP-API-KEY'])
    @list_id = ENV['MAILCHIMP-LIST-ID']
  end

  def create
    email = params[:email]

    subscription = SubscribeToNewsletterService.new(email)

  	if subscription.call
  	  flash[:notice] = "Your message has been sent! We will get back to you shortly!"
      # raise
      redirect_to connect_path
    else
      flash[:alert] = "Please fill out required fields!"
      redirect_to connect_path
    end
  end

  private 

  def call(email)
    @gibbon.lists(@list_id).members.create(
      body: {
        email_address: email,
        status: "subscribed",
        # merge_fields: {
        #   FNAME: @user.first_name,
        #   LNAME: @user.last_name
        # }
      }
    )
  end
end
