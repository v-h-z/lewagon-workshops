class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable :database_authenticatable
  devise :rememberable, :omniauthable, omniauth_providers: %i[github]
  # :registerable, :recoverable, :rememberable, :validatable

  validate :is_teacher

  def self.from_omniauth(auth)
    p auth.info.email
    where(provider: auth.provider, uid: auth.uid).first_or_create! do |user|
      user.email = auth.info.email
      user.github_nickname = auth.info.nickname
      # user.password = Devise.friendly_token[0, 20]
      user.full_name = auth.info.name # assuming the user model has a name
      user.avatar_url = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

  private

  def is_teacher
    return if LeWagon::CheckUserJob.perform_now(github_nickname)

    errors.add('user', "user must be Le Wagon's teacher")
  end
end
