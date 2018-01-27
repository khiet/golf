Knock.setup do |config|
  # full list of settings
  # https://github.com/nsarno/knock/blob/a48cbc5d684faf3c1a633aae50664367b64dcdef/lib/generators/templates/knock.rb

  config.token_lifetime = 1.year

  # these configs are set to default; hence, commented out
  # config.token_audience = nil
  # config.token_signature_algorithm = 'HS256'
  # config.token_secret_signature_key = -> { Rails.application.secrets.secret_key_base }
  # config.token_public_key = nil
  # config.not_found_exception_class_name = 'ActiveRecord::RecordNotFound'
end
