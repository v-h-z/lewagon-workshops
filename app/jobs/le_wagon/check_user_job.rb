class LeWagon::CheckUserJob < ApplicationJob
  queue_as :default

  def perform(username)
    url = URI("https://kitt.lewagon.com/api/v1/users?search=#{username}")
    users = LeWagon::ApiRequestJob.perform_now(url)["users"]
    # users.map { |user| user.dig('alumnus', 'github').downcase }.include?(username.downcase)
    users.map { |user|
      next unless user.dig('alumnus', 'github').downcase == username.downcase

      user.dig('alumnus', 'teacher')
    }.any?
    # renvoyer le numéro de batch ?
  end
end
