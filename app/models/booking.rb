class Booking < ActiveRecord::Base
   belongs_to :user
   belongs_to :event
   validates :cost, presence: true
   validates_inclusion_of :payment, :in => [true, false]
   validates :guests, presence: true
   validates :name, presence: true
   validates :user_id, presence: true
   validates :event_id, presence: true
end