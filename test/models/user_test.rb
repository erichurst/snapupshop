require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "an api_token is created" do
    user = User.create!(instagram_username: 'eh')
    refute_nil user.api_token
  end
end
