class AddPostcodeToTeaples < ActiveRecord::Migration
  def change
    add_column :teaples, :postcode, :string
  end
end
