class SubscribeToNewsletterService
  def initialize(user)
    @user = user
    @gibbon = Gibbon::Request.new(api_key: "3dd3dba831f1bbf578302e564475c0b2-us17")
    @list_id = "1e1df70b4b"
  end

  def call
    @gibbon.lists(@list_id).members.create(
      body: {
        email_address: @user,
        status: "subscribed",
        # merge_fields: {
        #   FNAME: @user.first_name,
        #   LNAME: @user.last_name
        # }
      }
    )
  end
end