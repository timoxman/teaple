class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :messageText

      t.timestamps null: false
    end
  end
end
