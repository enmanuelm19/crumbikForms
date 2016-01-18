class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:google_oauth2]

#  def self.find_for_google_oauth2(access_token, signed_in_resource = nil)
#
#    data = access_token.info
#
#    user = User.where(:provider => access_token.provider, :uid => access_token.uid ).first
#
#    if user
#
#      return user
#
#    else
#
#      registered_user = User.where(:email => access_token.info.email).first
#
#      if registered_user
#
#        return registered_user
#
#      else
#
#        access_token.provider = “Google”
#
#        user = User.create(first_name: data[“first_name”],
#
#            last_name: data[“last_name”],
#
#            provider:access_token.provider,
#
#            email: data[“email”],
#
#            password: Devise.friendly_token[0,20],
#
#            confirmed_at:Time.zone.now # if u don’t want to send any confirmation mail
#
#        )
#
#      end
#
#    end
#
#  end

def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    #user.name = auth.info.name   # assuming the user model has a name
    #user.image = auth.info.image # assuming the user model has an image
  end
end

#def self.from_omniauth(access_token)
#  data = access_token.info
#  user = User.where(:email => data["email"]).first

  # Uncomment the section below if you want users to be created if they don't exist
#   unless @user
#     #name: data["name"],
#       user = User.create(email: data["email"],
#          password: Devise.friendly_token[0,20]
#       )
#   end
#  user
#end
end
