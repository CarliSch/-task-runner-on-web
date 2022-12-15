require 'oauth2'
def christoffer
  client = OAuth2::Client.new(Rails.application.credentials.taskrunner_stag.client_id,
                              Rails.application.credentials.taskrunner_stag.client_secret,
                              site: 'https://api-stag.c2.taskrunner.se',
                              authorize_url: "/oauth/v2/token",
                              token_url: "/oauth/v2/token",
                              token_method: "post")
  # => #<OAuth2::Client: @id="client_id", @secret="client_secret", @site="https://example.org",
  #  @options={:authorize_url=>"/oauth/authorize", :token_url=>"/oauth/token",
  #    :token_method=>:post, :auth_scheme=>:request_body, :connection_opts=>{},
  #     :connection_build=>nil, :max_redirects=>5, :raise_errors=>true}>

  # Generate authorize URL. User need follow this URL to authiorize client.
  # client.auth_code.authorize_url(redirect_uri: 'http://localhost:8080/oauth2/callback')
  # => "https://example.org/oauth/authorize?client_id=client_id&redirect_uri=http%3A%2F%2Flocalhost%3A8080%2Foauth2%2Fcallback&response_type=code"

  # Callback processing from :redirect_uri. Once authorized, an 'authorization_code_value' will
  # token = client.auth_code.get_token('authorization_code_value',
  # headers: {'Authorization' => 'Basic some_password'})
  params = { "scope" => "android_poster" }
  token = client.client_credentials.get_token(params)
  puts token
  response = token.get("/oauth/v2/token")
  console.log(response)
end
