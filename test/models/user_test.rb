require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "create from instagram response" do
    user = User.find_or_create_from_instagram_response(instagram_response)
    assert_equal "1574083", user.instagram_id
    assert_equal "snoopdogg", user.instagram_username
    assert_equal "Snoop Dogg", user.instagram_full_name
    assert_match "1295469061.jpg", user.instagram_profile_picture
    assert_equal "fb2e77d.47a0479900504cb3ab4a1f626d174d2d", user.access_token
  end

  test "find from instagram response" do
    existing_user = create(:user)
    session_user = User.find_or_create_from_instagram_response(instagram_response)
    assert_equal session_user.instagram_id, existing_user.instagram_id
  end

  test "an api_token is created" do
    user = create(:user)
    refute_nil user.api_token
  end
end
