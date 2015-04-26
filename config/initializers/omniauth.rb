Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '348544855355699', '37a468d4a8f16b7aee82e6e90775c3a0'
end
