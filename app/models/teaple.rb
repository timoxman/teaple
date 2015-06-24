class Teaple < ActiveRecord::Base

  has_many :messages
  belongs_to :user

  geocoded_by :postcode
  after_validation :geocode

  def No_Of_Messages
    return "(" + Message.where(teaple_id: self.id).count.to_s + ")"
  end

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

end
