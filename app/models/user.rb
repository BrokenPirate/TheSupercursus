 class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         # give us the user data
user = {
  :user => {
    :id => 'johndoe', # required
    :displayname => 'John Doe', # required
    :email => 'john.doe@gmail.com',
    :avatar => '//gravatar.com/avatar/e5fb96fe7ec4ac3d4fa675422f8d1fb9',
    :is_admin => true,
  }
}

require 'digest/sha1'
require 'base64'
require 'json'

# timestamp (in seconds). Improves security.
timestamp = Time.now.to_i

# Message (base64 encoded string)
message = Base64.strict_encode64 user.to_json

# Signature (signed with private key)
signature = Digest::SHA1.hexdigest "BYUMTrGxeeb9vS1U871jLkZH #{message} #{timestamp}"
end
