class LandingController < ApplicationController
  def show
  end

  def create
  	email = params[:email]
  	name = params[:name]

    set(email, name)

  	if call
  	  flash[:notice] = "Your message has been sent! We will get back to you shortly!"
      # raise
      redirect_to root_path
    else
      flash[:alert] = "Please fill out required fields!"
      redirect_to root_path
    end
  end

  private

  def set(user, name)
    @user = user
    @first = ""
    @last = ""
    if name.split.length == 2
      @first = name.split(" ")[0]
      @last = name.split(" ")[1]
    else
      @first = name.split(" ")[0]
    end
    @gibbon = Gibbon::Request.new(api_key: "3dd3dba831f1bbf578302e564475c0b2-us17")
    @list_id = "1e1df70b4b"
  end

  def call
    begin
      @gibbon.lists(@list_id).members.create(
      body: {
        email_address: @user,
        status: "subscribed",
        merge_fields: {
          FNAME: @first,
          LNAME: @last
        }
      }
    )
    flash[:notice] = "Your message has been sent! We will get back to you shortly!" 
    rescue Gibbon::MailChimpError => e
      flash[:alert] = "Please fill out required fields!"
    end
  end
end
