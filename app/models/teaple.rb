class Teaple < ActiveRecord::Base

  has_many :messages
  belongs_to :user

  geocoded_by :postcode
  after_validation :geocode

  def No_Of_Messages
    return "(" + Message.where(teaple_id: self.id).count.to_s + ")"
  end

end
