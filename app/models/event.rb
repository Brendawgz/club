class Event < ActiveRecord::Base
   has_many :event_bookings
   has_many :bookings, through: :event_bookings 
   accepts_nested_attributes_for :bookings
   validates :name, presence: true,
            uniqueness: {case_sensitive: false},
            length: {minimum: 4, maximum: 40}
   validates :date, presence: true
   validates :capacity, presence: true
   validates :theme, presence: true
end