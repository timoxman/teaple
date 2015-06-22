class AddBioToTeaples < ActiveRecord::Migration
  def change
    add_column :teaples, :bio, :text
  end
end
