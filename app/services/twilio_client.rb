class TwilioClient
  attr_reader :client

  def initialize
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def send_text(user, message)
    client.api.account.messages.create(
      from: phone_number,
      to: user.phone,
      body: message
    )
    # @client.messages.create(
  end
  private

  def account_sid
    ENV["ACCOUNT_SID"]
  end

  def auth_token
    ENV["AUTH_TOKEN"]
  end

  def phone_number
    ENV["PHONE_NUMBER"]
  end
end
