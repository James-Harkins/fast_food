Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_CLIENT_SECRET"]
end
OmniAuth.config.allowed_request_methods = %i[get]
OmniAuth.config.test_mode = true
OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new({
  provider: "google",
  uid: "2345",
  name: "Example User",
  email: "example@example.com"
})
OmniAuth.config.silence_get_warning = true
