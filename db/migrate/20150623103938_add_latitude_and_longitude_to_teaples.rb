class AddLatitudeAndLongitudeToTeaples < ActiveRecord::Migration
  def change
    add_column :teaples, :latitude, :float
    add_column :teaples, :longitude, :float
  end
end
