class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :attendances, foreign_key: "attended_event_id"
  has_many :attendees, through: :attendances

  scope :past, -> { where("date < ?", DateTime.current) }
  scope :upcoming, -> { where("date >= ?", DateTime.current) }

 # queries through class methods

 # def self.past
 #   Event.where("date < ?", DateTime.current)
 # end

 # def self.upcoming
 #   Event.where("date >= ?", DateTime.current)
 # end
end
