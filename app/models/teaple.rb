class Teaple < ActiveRecord::Base

  has_many :messages
  belongs_to :user

  geocoded_by :postcode
  after_validation :geocode

end
