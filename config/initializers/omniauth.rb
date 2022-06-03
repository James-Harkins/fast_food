Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_CLIENT_SECRET"]
end
OmniAuth.config.allowed_request_methods = %i[get]
OmniAuth.config.test_mode = true
OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
  provider: "google",
  uid: "123545"
})
OmniAuth.config.silence_get_warning = true
