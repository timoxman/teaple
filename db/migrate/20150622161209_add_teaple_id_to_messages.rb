class AddTeapleIdToMessages < ActiveRecord::Migration
  def change
    add_reference :messages, :teaple, index: true, foreign_key: true
  end
end
