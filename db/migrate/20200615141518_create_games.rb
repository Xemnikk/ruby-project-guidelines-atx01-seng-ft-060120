class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :name
      t.string :last_choice
      t.string :current_choice
      t.integer :saves_id
    end
  end
end
