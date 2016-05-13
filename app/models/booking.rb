class Booking < ActiveRecord::Base
   belongs_to :user
   has_many :event_bookings
   has_many :events, through: :event_bookings
   accepts_nested_attributes_for :events
   validates :cost, presence: true
   validates_inclusion_of :payment, :in => [true, false]
   validates :guests, presence: true
   validates :name, presence: true
   validates :user_id, presence: true
end