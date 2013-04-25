FactoryGirl.define do
  factory :user do
    instagram_username            { "snoopdogg" }
    email                         { "snoopdogg@test.com" }
    access_token                  { "fb2e77d.47a0479900504cb3ab4a1f626d174d2d" }
    instagram_id                  { "1574083" }
    instagram_full_name           { "Snoop Dogg" }
    instagram_profile_picture     { "http://distillery.s3.amazonaws.com/profiles/profile_1574083_75sq_1295469061.jpg" }
  end
end
