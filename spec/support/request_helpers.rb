module RequestHelpers
  module AuthenticationHelpers
    def authorization_header(user)
      token = Knock::AuthToken.new(payload: { sub: user.id }).token

      { 'Authorization': "Bearer #{token}" }
    end
  end

  module JsonHelpers
    def json_body
      JSON.parse(response.body)
    end
  end
end

RSpec.configure do |config|
  config.include RequestHelpers::JsonHelpers, type: :request
  config.include RequestHelpers::AuthenticationHelpers, type: :request
end
