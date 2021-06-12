class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :add_slack_info
  after_create :slack_message_confirmation

  private

  def add_slack_info
    update_columns(Slack::GetUserInfoJob.perform_now(email: email))
  end

  def slack_message_confirmation
    Slack::PostMessageJob.perform_now(
      channel: "@#{slack_id}",
      message: "Welcome on Le Wagon Workshop!"
    )
  end
end
