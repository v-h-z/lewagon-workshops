class Slack::GetUserIdJob < ApplicationJob
  queue_as :default

  def perform(email:)
    url = URI("https://slack.com/api/users.lookupByEmail?email=#{email}")
    Slack::ApiRequestJob.perform_now(url)
  end
end
