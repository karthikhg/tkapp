class HomeController < ApplicationController

  # include 'HTTParty'

  CONSUMER_KEY        = '3IJflMciFqkfWy5P4T8Q5iTM9fZavDUWfghMdvPt'
  CONSUMER_SECRET     = 'x38ywvPbZ4K1Al7erzkyJ21c143uNhbU3pDpx0JA'
  ACCESS_TOKEN        = '90xekrjb5YoLrKvQ1gr9aBm3oI7EqY3fxHPfoRAV'
  ACCESS_TOKEN_SECRET = 'JztrqhwuWEMtNLEGLhHpa5W2HIqJqLOumKIBjx08'

  def index
    @test1 = "Helloo!!!"
    @consumer = OAuth::Consumer.new CONSUMER_KEY, CONSUMER_SECRET, { :site => 'https://api.tradeking.com' }

    # Manually update the access token/secret.  Typically this would be done through an OAuth callback when 
    # authenticating other users.
    @access_token = OAuth::AccessToken.new(@consumer, ACCESS_TOKEN, ACCESS_TOKEN_SECRET)

# debugger
    # Make a request to the API endpoint and display the response
    resp = @access_token.get('/v1/accounts.json', {'Accept' => 'application/json'})

    @response = ActiveSupport::JSON.decode(resp.body)["response"] if resp.code == "200"

    @holdings = @response["accounts"]["accountsummary"]["accountholdings"]["holding"]
  end

  def quote
    # debugger
    resp = HTTParty.get("http://chart.finance.yahoo.com/z?s=#{params[:id]}")
    # content_type 'image/png'
    # attachment("stock.png")

    send_file StringIO.new(resp.body).read#, type: "image/png", x_sendfile: true, filename: 'stock.png', disposition: "attachment"
    # File.read resp.body
    # respond_to do |format|
    #   format.png { render File.read(resp.body) } 
    # end
  end

end

