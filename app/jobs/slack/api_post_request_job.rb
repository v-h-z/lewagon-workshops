class Slack::ApiPostRequestJob < ApplicationJob
  queue_as :default

  def perform(url:, payload:)
    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Post.new(url)
    request["Authorization"] = ENV["SLACK_TOKEN"]
    request["Content-Type"] = "application/json"
    request.body = payload.to_json

    response = https.request(request)
    JSON.parse(response.read_body)
  end
end
