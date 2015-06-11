class User < ActiveRecord::Base
  # TEMP_EMAIL_PREFIX = 'change@me'
  # TEMP_EMAIL_REGEX = /\Achange@me/

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable
  attr_accessible :first_name, :card, :subscribe_to, :password_confirmation , :phone

  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_many :carts
   def current_cart
    if self.carts.length == 0 || self.carts.last.finished_at
      self.build_cart
    end
    self.carts.last
   end

  attr_accessible :email, :password

  attr_accessible :nickname, :provider, :url, :username

  # validates_format_of :email, :without => TEMP_EMAIL_REGEX, on: :update
  def self.from_omniauth(auth)
    # where(auth.slice(:provider, :uid)).first_or_create do |user|
    where(provider: auth.provider, uid: auth.uid, first_name: auth.first, last_name: auth.last_name).first_or_create do |user|
      user.first_name = auth.first_name
      user.last_name = auth.last_name
      user.provider =auth.provider
      user.uid = auth.uid
      user.username = auth.info.nickname
    end
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  def password_required?
    super && provider.blank?
  end
  # def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
  #   user = User.where(:provider => auth.provider, :uid => auth.uid).first
  #   if user
  #     return user
  #   else
  #     registered_user = User.where(:email => auth.info.email).first
  #     if registered_user
  #       return registered_user
  #     else
  #       user = User.create(name:auth.extra.raw_info.name,
  #                           provider:auth.provider,
  #                           uid:auth.uid,
  #                           email:auth.info.email,
  #                           password:Devise.friendly_token[0,20],
  #                         )
  #     end
  #   end
  # end

  # def self.find_for_facebook_oauth access_token
  #   if user = User.where(:url => access_token.info.urls.Facebook).first
  #     user
  #   else
  #     User.create!(:provider => access_token.provider, :url => access_token.info.urls.Facebook, :username => access_token.extra.raw_info.name, :nickname => access_token.extra.raw_info.username, :email => access_token.extra.raw_info.email, :password => Devise.friendly_token[0,20])
  #   end
  # end
  # def self.find_for_vkontakte_oauth access_token
  #    if user = User.where(:url => access_token.info.urls.Vkontakte).first
  #      user
  #    else
  #      User.create!(:provider => access_token.provider, :url => access_token.info.urls.Vkontakte, :username => access_token.info.name, :nickname => access_token.extra.raw_info.domain, :email => access_token.extra.raw_info.domain + '@vk.com', :password => Devise.friendly_token[0,20])
  #    end
  #  end
  # def self.find_for_oauth(auth, signed_in_resource = nil)
  #
  #   # Get the identity and user if they exist
  #   identity = Identity.find_for_oauth(auth)
  #
  #   # If a signed_in_resource is provided it always overrides the existing user
  #   # to prevent the identity being locked with accidentally created accounts.
  #   # Note that this may leave zombie accounts (with no associated identity) which
  #   # can be cleaned up at a later date.
  #   user = signed_in_resource ? signed_in_resource : identity.user
  #
  #   # Create the user if needed
  #   if user.nil?
  #
  #     # Get the existing user by email if the provider gives us a verified email.
  #     # If no verified email was provided we assign a temporary email and ask the
  #     # user to verify it on the next step via UsersController.finish_signup
  #     email_is_verified = auth.info.email && (auth.info.verified || auth.info.verified_email)
  #     email = auth.info.email if email_is_verified
  #     user = User.where(:email => email).first if email
  #
  #     # Create the user if it's a new registration
  #     if user.nil?
  #       user = User.new(
  #         name: auth.extra.raw_info.name,
  #         #username: auth.info.nickname || auth.uid,
  #         email: email ? email : "#{TEMP_EMAIL_PREFIX}-#{auth.uid}-#{auth.provider}.com",
  #         password: Devise.friendly_token[0,20]
  #       )
  #       user.skip_confirmation!
  #       user.save!
  #     end
  #   end

    # Associate the identity with the user if needed
  #   if identity.user != user
  #     identity.user = user
  #     if identity.valid?
  #       identity.save!
  #     else
  #       render inline: "#{identity.inspect}<br/>#{identity.errors.inspect}"
  #     end
  #   end
  #   user
  # end

  # def email_verified?
  #   self.email && self.email !~ TEMP_EMAIL_REGEX
  # end
end
