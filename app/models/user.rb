class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :add_slack_info

  private

  def add_slack_info
    update_columns(Slack::GetUserInfoJob.perform_now(email: email))
  end
end
