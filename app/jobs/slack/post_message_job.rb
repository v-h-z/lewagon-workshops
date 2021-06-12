class Slack::PostMessageJob < ApplicationJob
  queue_as :default

  def perform(channel:, message:)
    url = URI("https://slack.com/api/chat.postMessage")
    payload = {
      channel: channel,
      text: message
    }

    Slack::ApiPostRequestJob.perform_now(url: url, payload: payload)
  end
end
