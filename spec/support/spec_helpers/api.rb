module SpecHelpers
  module API
    def json_body
      JSON.parse(response.body)
    end
  end
end

RSpec.configure do |config|
  config.include SpecHelpers::API
end
