class AddAttachmentImageToTeaples < ActiveRecord::Migration
  def self.up
    change_table :teaples do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :teaples, :image
  end
end
