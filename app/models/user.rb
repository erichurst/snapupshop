### Attributes
# 
# instagram_username    The users instagram screename
# email                 Optional attribute
# api_token             Generated by `generate_api_token
# access_token          Oauth token returned by Instagram
#
class User < ActiveRecord::Base
  before_create :generate_api_token

  def self.create_from_instagram_response(response)
    User.where(instagram_id: response[:user][:id]).first_or_create!({
      instagram_username:             response[:user][:username],
      instagram_full_name:            response[:user][:full_name],
      instagram_profile_picture:      response[:user][:profile_picture],
      access_token:                   response[:access_token]
    })
  end

  protected
  def generate_api_token
    self.api_token = Base64.urlsafe_encode64(SecureRandom.urlsafe_base64(128) + "#{Time.now.to_f*1000}")
  end
end
