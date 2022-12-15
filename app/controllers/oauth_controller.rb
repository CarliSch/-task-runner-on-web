class OauthController < ApplicationController
  def initialize
    @app_conn = Faraday.new(url: 'https://api-stag.c2.taskrunner.se', headers: { "Content-Type" => "application/x-www-form-urlencoded"})
    # @oauth_client = OAuth2::Client.new(Rails.application.credentials.taskrunner_stag.client_id,
    #                                    Rails.application.credentials.taskrunner_stag.client_secret,
    #                                    site: 'https://api-stag.c2.taskrunner.se',
    #                                    authorize_url: "/oauth/v2/token",
    #                                    token_url: "/oauth/v2/token",
    #                                    redirect_uri: "http://localhost:3000/oauth2-callback",
    #                                    token_method: "post")
    response = Faraday.get('http://httpbingo.org')
    console.log(response)
  end
  # The OAuth callback

  def logout
    # Invalidate session with FusionAuth
    @oauth_client.request(:get, 'oauth2/logout')

    # Reset Rails session
    reset_session

    redirect_to root_path
  end

  def login
    # params = { client_id: Rails.application.credentials.taskrunner_stag.client_id,
    #            client_secret: Rails.application.credentials.taskrunner_stag.client_secret }

    # body = { scope: 'web_poster',
    #          grant_type: 'client_credentials' }
    response = Faraday.get('http://httpbingo.org')
    # encoded_params = URI.encode_www_form(params)
    # encoded_body = URI.encode_www_form(body)
    # response = Faraday.post('https://api-stag.c2.taskrunner.se/oauth/v2/token',
    #                         body: encoded_params,
    #                         headers: { 'Content-Type' => "application/x-www-form-urlencoded" })
    # console.log(response.status)
  end
  # console.log(response.status)
end
