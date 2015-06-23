class Teaple < ActiveRecord::Base

  has_many :messages

  geocoded_by :postcode
  after_validation :geocode

end
