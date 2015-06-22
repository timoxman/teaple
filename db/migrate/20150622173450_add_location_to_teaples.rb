class AddLocationToTeaples < ActiveRecord::Migration
  def change
    add_column :teaples, :location, :text
  end
end
