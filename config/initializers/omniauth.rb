Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env.development?
    provider :openid_connect, {
      name: :google,
      scope: [:openid, :profile],
      response_type: :code,
      issuer: "https://accounts.google.com",
      uid_field: "sub",
      discovery: true,
      client_options: {
        identifier: ENV["OIDC_GOOGLE_CLIENT_ID"],
        secret: ENV["OIDC_GOOGLE_SECRET_KEY"],
        redirect_uri: 'http://localhost:3000/auth/google/callback'
      }
    }
  end
end
