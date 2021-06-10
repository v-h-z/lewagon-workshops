class LeWagon::ApiRequestJob < ApplicationJob
  queue_as :default

  def perform(url)
    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["Cookie"] = ENV['WAGON_COOKIE']
    request["Accept-Encoding"] = "br, gzip, deflate"
    request["Host"] = "kitt.lewagon.com"
    request["Referer"] = "https://kitt.lewagon.com/alumni"
    request["Connection"] = "keep-alive"

    response = https.request(request)
    JSON.parse(response.read_body)
  end
end
