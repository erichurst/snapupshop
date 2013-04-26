ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'hashie'

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!
  include FactoryGirl::Syntax::Methods

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...

  Turn.config.format = :outline
end

def instagram_response
  Hashie::Mash.new(access_token: "fb2e77d.47a0479900504cb3ab4a1f626d174d2d",
      user: {
          id: "1574083",
          username: "snoopdogg",
          full_name: "Snoop Dogg",
          profile_picture: "http://distillery.s3.amazonaws.com/profiles/profile_1574083_75sq_1295469061.jpg"
      }
  )
end
