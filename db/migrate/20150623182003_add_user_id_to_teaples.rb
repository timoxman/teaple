class AddUserIdToTeaples < ActiveRecord::Migration
  def change
    add_reference :teaples, :user, index: true, foreign_key: true
  end
end
