class Slack::GetUserInfoJob < ApplicationJob
  queue_as :default

  def perform(email:)
    url = URI("https://slack.com/api/users.lookupByEmail?email=#{email}")

    response = Slack::ApiGetRequestJob.perform_now(url: url)
    return unless response["ok"]

    user = response['user']
    {
      slack_id: user['id'],
      slack_name: user['name'],
      slack_real_name: user['real_name']
    }
  end
end
