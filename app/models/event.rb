class Event < ActiveRecord::Base

   belongs_to :user
   has_and_belongs_to_many :tags


   geocoded_by :address
   after_validation :geocode, :if => :address_changed?
end
