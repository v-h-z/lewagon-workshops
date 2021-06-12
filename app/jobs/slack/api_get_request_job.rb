class Slack::ApiGetRequestJob < ApplicationJob
  queue_as :default

  def perform(url:)
    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["Authorization"] = ENV["SLACK_TOKEN"]

    response = https.request(request)
    JSON.parse(response.read_body)
  end
end
