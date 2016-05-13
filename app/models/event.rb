class Event < ActiveRecord::Base
   has_many :bookings, dependent: :destroy
   validates :name, presence: true,
            uniqueness: {case_sensitive: false},
            length: {minimum: 4, maximum: 40}
   validates :date, presence: true
   validates :capacity, presence: true
   validates :theme, presence: true
end