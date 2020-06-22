class CreateSaves < ActiveRecord::Migration[6.0]
  def change
    create_table :saves do |t|
      t.string :name
      t.integer :games_id
      t.integer :users_id
    end
  end
end
