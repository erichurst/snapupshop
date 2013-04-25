require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "create from instagram response" do
    response = Hashie::Mash.new(access_token: "fb2e77d.47a0479900504cb3ab4a1f626d174d2d",
                    user: {
                        id: "1574083",
                        username: "snoopdogg",
                        full_name: "Snoop Dogg",
                        profile_picture: "http://distillery.s3.amazonaws.com/profiles/profile_1574083_75sq_1295469061.jpg"
                    }
                )
    user = User.create_from_instagram_response(response)
    assert_equal "1574083", user.instagram_id
    assert_equal "snoopdogg", user.instagram_username
    assert_equal "Snoop Dogg", user.instagram_full_name
    assert_match "1295469061.jpg", user.instagram_profile_picture
    assert_equal "fb2e77d.47a0479900504cb3ab4a1f626d174d2d", user.access_token
  end

  test "an api_token is created" do
    user = User.create!(instagram_username: 'eh')
    refute_nil user.api_token
  end
end
