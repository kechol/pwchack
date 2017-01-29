class CreateSelfies < ActiveRecord::Migration[5.0]
  def change
    create_table :selfies do |t|
      t.integer :room_id, index: true
      t.json :image
      t.timestamps
    end
  end
end
