class LeWagon::CheckUserJob < ApplicationJob
  queue_as :default

  def perform(username)
    url = URI("https://kitt.lewagon.com/api/v1/users?search=#{username}")
    users = LeWagon::ApiRequestJob.perform_now(url)["users"]
    users.map { |user| user.dig('alumnus', 'github').downcase }.include?(username.downcase)
  end
end
