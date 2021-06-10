class Teaching < ApplicationRecord
  belongs_to :user
  belongs_to :workshop

  validates :starting_date, presence: true
end
